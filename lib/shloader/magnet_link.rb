class MagnetLink
  attr_reader :url
  attr_reader :episode

  def initialize(url, episode)
    @url, @episode = url, episode
  end

end