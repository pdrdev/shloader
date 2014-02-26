class ThePirateBayTracker
  def initialize(http_client)
    @http_client = http_client
  end

  def get_links(episodes)
    links = []
    episodes.each do |episode|
      html = @http_client.fetch "http://thepiratebay.se/search/#{CGI::escape(episode.to_s)}/0/99/0"
      link_url = extract_magnet(html)
      if !link_url.nil?
        links.push (MagnetLink.new link_url, episode)
      end
    end
    links
  end

  def extract_magnet(html)
    match_res = html.scan(/"magnet:[^"]*"/)
    match_res.each do |match|
      if match.include? 'ett'
        return match.gsub('"', '')
      end
    end
    nil
  end
end
