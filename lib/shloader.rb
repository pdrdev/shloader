lib = File.dirname(__FILE__)

Dir["#{lib}/shloader/*.rb"].each {|file| require file }

Main.new.run
