class Main

  def initialize
    @episode_source = DefaultEpisodeSource.new
    @tracker = ThePirateBayTracker.new
  end

  def run
    Logger.log 'Shloader started'

    begin
      config = ShloaderConfig.new
      myshows = Myshows.new(config)
      puts myshows.unwatched_episodes
    rescue Exception => e
      Logger.log('Shloader crashed!', Logger::ERROR)
      puts e.message
      puts e.backtrace.inspect
    end

    Logger.log 'Shloader stopped'
  end

end
