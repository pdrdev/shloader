require 'rspec'

lib = File.dirname(__FILE__) + '/../lib'
puts 'lib: ' + lib
Dir["#{lib}/shloader/*.rb"].each {|file| require file }

describe MyshowsJsonParser do

  it "should parse json with list of episodes" do
    true.should == false
  end
end
