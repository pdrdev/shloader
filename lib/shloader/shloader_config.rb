class ShloaderConfig
  attr_reader :myshows_login
  attr_reader :myshows_password

  def initialize
    File.open('config').each do |line|
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
  end
end