class Main

  def initialize
    @episode_source = DefaultEpisodeSource.new
    @tracker = ThePirateBayTracker.new
  end

  def run
    puts 'Shloader started'

    begin
      config = ShloaderConfig.new
      myshows = Myshows.new(config)
      myshows.login
      puts myshows.unwatched_episodes
    rescue Exception => e
      puts 'Shloader crashed!'
      puts e.message
      puts e.backtrace.inspect
    end

    puts 'Shloader stopped'
  end

end
