class DefaultEpisodeSource
  def get_episodes_to_download
    [Episode.new("Example show", 12, 34)]
  end
end
