require 'rspec'
require 'json'

lib = File.expand_path(File.dirname(__FILE__)) + '/../lib'
Dir["#{lib}/shloader/*.rb"].each {|file| require file }

describe MyshowsJsonParser do

  it "should parse json with list of episodes" do
    json_str = File.open(File.dirname(__FILE__) + '/data/myshows_episodes.json').read
    episodes = MyshowsJsonParser.new.parse_episodes(json_str)
    episodes.length.should == 47

    first_episode = episodes[0]
    first_episode.show_id.should == 186
    first_episode.season_number.should == 1
    first_episode.episode_number.should == 0
  end

  it "should parse show infos" do
    json_str = File.open(File.dirname(__FILE__) + '/data/bored_to_death.json').read
    show_info = MyshowsJsonParser.new.parse_show_info(json_str)

    show_info.name.should == 'Bored to Death'
  end
end
