class Episode
  attr_reader :show_name
  attr_reader :season_number
  attr_reader :number_in_season

  def initialize(show_name, season_number, number_in_season)
    @show_name, @season_number, @number_in_season = show_name, season_number, number_in_season
  end
end
