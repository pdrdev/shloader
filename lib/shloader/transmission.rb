class Transmission
  def download_all(links)
    processed = get_processed
    links.each do |link|
      if !processed?(processed, link.episode)
        download link
      else
        Logger.log "#{link.episode.to_s} has already been processed"
      end
    end
  end

  def download(link)
    base_directory = File.expand_path(File.dirname(__FILE__)) + '/../..'
    command =
        "transmission-remote" +
        " --incomplete-dir #{base_directory}/incomplete" +
       " -w #{base_directory}/completed" +
        " --add " + link.url
    Cmd.execute command
  end

  def processed? (processed, episode)
    processed[episode.show_id.to_s + '_' + episode.season_number.to_s + '_' + episode.episode_number.to_s]
  end

  def get_processed
    res = Hash.new
    File.readlines('./data/processed').each do |line|
      tokens = line.split ' '
      res[tokens[0] + '_' + tokens[1] + '_' + tokens[2]] = true
    end
    res
  end

  def add_to_processed(episode)
    File.open('./data/processed', 'a') do |file|
      file.write episode.show_id.to_s + ' ' + episode.season_number.to_s + ' ' + episode.episode_number.to_s + "\n"
    end
  end
end
