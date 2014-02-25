require 'net/http'
require 'json'

lib = File.expand_path(File.dirname(__FILE__))

Dir["#{lib}/shloader/*.rb"].each {|file| require file }

Main.new.run
