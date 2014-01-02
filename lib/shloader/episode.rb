class Episode
  attr_reader :show_name
  attr_reader :season_number
  attr_reader :episode_number

  def initialize(show_name, season_number, episode_number)
    @show_name, @season_number, @episode_number = show_name, season_number, episode_number
  end
end
