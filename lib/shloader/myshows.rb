class Myshows

  def initialize(config)
    @login = config.myshows_login
    @password = config.myshows_password
  end

  def login
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
    response.body
  end
end
