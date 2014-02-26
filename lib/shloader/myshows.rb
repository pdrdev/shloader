class Myshows

  def initialize(config, json_parser)
    @login = config.myshows_login
    @password = config.myshows_password
    @show_infos = Hash.new
    @json_parser = json_parser
    login!
  end

  def login!
    uri = URI.parse("http://api.myshows.ru/profile/login?login=#{@login}&password=#{@password}")
    response = Net::HTTP.get_response(uri)
    header = response.header
    cookie = header['set-cookie']
    match = /.*PHPSESSID=(([^;])+);.*/.match(cookie)
    captures = match.captures
    @phpSessionId = captures[0]
  end

  def unwatched_episodes
    uri = URI.parse("http://api.myshows.ru")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new("/profile/episodes/unwatched/")
    request.add_field('Cookie', "PHPSESSID=#{@phpSessionId}")
    response = http.request(request)
    episodes = @json_parser.parse_episodes (response.body)

    episodes.each do |episode|
      episode.show_name = show_info(episode.show_id).name
    end
    episodes
  end

  # TODO cache it!
  def show_info(show_id)
    if @show_infos.key?(show_id)
      return @show_infos[show_id]
    end

    uri = URI.parse("http://api.myshows.ru")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new("/shows/#{show_id}")
    response = http.request(request)
    show_info = @json_parser.parse_show_info (response.body)
    @show_infos[show_id] = show_info
    show_info
  end
end
