class Episode
  attr_reader :show_id
  attr_reader :season_number
  attr_reader :episode_number

  attr_accessor :show_name

  def initialize(show_id, season_number, episode_number)
    @show_id, @season_number, @episode_number = show_id, season_number, episode_number
  end
end
