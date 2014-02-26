class HttpClient
  def fetch(url)
    Logger.log "Fetching url: #{url}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response uri
    response.to_s
  end
end
