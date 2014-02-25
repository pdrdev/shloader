class Main

  def initialize
    @episode_source = DefaultEpisodeSource.new
    @tracker = ThePirateBayTracker.new
  end

  def run
    Logger.log 'Shloader started'

    begin
      config = ShloaderConfig.new
      json_parser = MyshowsJsonParser.new
      myshows = Myshows.new(config, json_parser)
      puts myshows.unwatched_episodes
      puts myshows.show_info('186')
    rescue Exception => e
      Logger.log('Shloader crashed!', Logger::ERROR)
      puts e.message
      puts e.backtrace.inspect
    end

    Logger.log 'Shloader stopped'
  end

end
