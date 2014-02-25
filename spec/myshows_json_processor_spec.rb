require 'rspec'

lib = File.expand_path(File.dirname(__FILE__)) + '/../lib'
Dir["#{lib}/shloader/*.rb"].each {|file| require file }

describe MyshowsJsonParser do

  it "should parse json with list of episodes" do
    true.should == false
  end
end
