class Options
  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.debug = true
    options.verbose = true
    options.should_run = true

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: shloader.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.on("-d", "--[no-]debug", "Run in debug mode") do |d|
        options.debug = d
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        options.should_run = false
        return
      end
    end

    opt_parser.parse!(args)
    options
  end
end
