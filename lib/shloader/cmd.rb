class Cmd

  # Execute a command
  def self.execute(command)
    Logger.log "Executing command: #{command}"
    # 2>&1 is used to redirect stderr to stdout
    output = p `#{command} 2>&1`
    Logger.log "Command output: #{output}"
    output
  end
end