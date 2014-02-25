class MyshowsJsonParser
  def parse_episodes(json_str)
    json = JSON.parse(json_str)
    episodes = Array.new
    json.each do |episode_id_and_json|
      episode_json = episode_id_and_json[1]
      episodes.push(Episode.new(Integer(episode_json['showId']), Integer(episode_json['seasonNumber']), Integer(episode_json['episodeNumber'])))
    end
    episodes
  end

  def parse_show_info(json_str)
    json = JSON.parse(json_str)
    Show.new json['title']
  end
end
