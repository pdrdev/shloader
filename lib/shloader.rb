require 'net/http'
require 'json'
require 'cgi'
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

lib = File.expand_path(File.dirname(__FILE__))

Dir["#{lib}/shloader/*.rb"].each {|file| require file }

Main.new.run
