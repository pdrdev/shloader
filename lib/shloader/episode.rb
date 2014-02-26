class Episode
  attr_reader :show_id
  attr_reader :season_number
  attr_reader :episode_number

  attr_accessor :show_name

  def initialize(show_id, season_number, episode_number)
    @show_id, @season_number, @episode_number = show_id, season_number, episode_number
  end

  def to_s
    # TODO fix it!
    show_name + ' ' + 'S0' + season_number.to_s + 'E0' + episode_number.to_s
  end
end
