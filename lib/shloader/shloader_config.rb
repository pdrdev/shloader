class ShloaderConfig
  CONFIG_FILE_PATH = 'config'

  attr_reader :myshows_login
  attr_reader :myshows_password

  def initialize
    begin
      File.open(CONFIG_FILE_PATH).each do |line|
        split = line.strip!.split('=')
        name = split[0]
        value = split[1]
        if name == 'login'
          @myshows_login = value
        end
        if name == 'password'
          @myshows_password = value
        end
      end
    rescue Errno::ENOENT => file_not_found_exception
      raise Exception.new "Could not open config file '#{CONFIG_FILE_PATH}'. Make sure it exists."
    end
  end
end