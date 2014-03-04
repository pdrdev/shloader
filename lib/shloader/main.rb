class Main

  def initialize
    @episode_source = DefaultEpisodeSource.new
    @http_client = HttpClient.new
    @tracker = ThePirateBayTracker.new(@http_client)
  end

  def run
    Logger.log 'Shloader started'

    begin
      options = Options.parse(ARGV)

      if options.should_run
        config = ShloaderConfig.new
        json_parser = MyshowsJsonParser.new
        myshows = Myshows.new(config, json_parser)
        @torrent_client = Transmission.new options
        unwatched_episodes = myshows.unwatched_episodes

        links = @tracker.get_links unwatched_episodes
        @torrent_client.download_all links
      end

    rescue Exception => e
      Logger.log('Shloader crashed!', Logger::ERROR)
      puts e.message
      puts e.backtrace.inspect
    end

    Logger.log 'Shloader stopped'
  end

end
