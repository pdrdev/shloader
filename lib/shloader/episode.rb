class Episode
  attr_reader :show_id
  attr_reader :season_number
  attr_reader :episode_number

  attr_accessor :show_name

  def initialize(show_id, season_number, episode_number)
    @show_id, @season_number, @episode_number = show_id, season_number, episode_number
  end

  def to_s
    season_number_str = if season_number < 10 then '0' + season_number.to_s else season_number.to_s end
    episode_number_str = if episode_number < 10 then '0' + episode_number.to_s else episode_number.to_s end
    "#{@show_name} S#{season_number_str}E#{episode_number_str}"
  end
end
