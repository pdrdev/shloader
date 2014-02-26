require 'rspec'
require 'json'

lib = File.expand_path(File.dirname(__FILE__)) + '/../lib'
Dir["#{lib}/shloader/*.rb"].each {|file| require file }

describe ThePirateBayTracker do

  it "should extract magnet links from the pirate bay" do
    episode = Episode.new(249, 5, 9)
    episode.show_name = 'Glee'


    tracker = ThePirateBayTracker.new(FakeHttpClient.new)
    links = tracker.get_links([episode])
    links[0].url.should == 'magnet:?xt=urn:btih:6eb88e45080e99fe594488ed86803f28b7ab965e&dn=Glee+S05E09+HDTV+x264-LOL%5Bettv%5D&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.istole.it%3A6969&tr=udp%3A%2F%2Ftracker.ccc.de%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337'

    links.length.should == 1
  end

end

class FakeHttpClient
  def fetch(url)
    File.open(File.dirname(__FILE__) + '/data/glee_s05e09.html').read
  end
end