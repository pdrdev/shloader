class Logger
  DEBUG     = 0
  INFO      = 1
  WARNING   = 2
  ERROR     = 3
  CRITICAL  = 4

  @level = DEBUG

  def self.log(s, level = INFO)
    if level >= @level
      puts Time.new.strftime("%H:%M:%S") + ' ' + s
    end
  end
end
