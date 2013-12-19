class Main

  def initialize
    @episode_source = DefaultEpisodeSource.new
    @tracker = ThePirateBayTracker.new
  end

  def run
    puts 'Shloader started'

    config = ShloaderConfig.new

    myshows = Myshows.new(config)
    myshows.login
    puts myshows.unwatched_episodes

    puts 'Shloader stopped'
  end

end
