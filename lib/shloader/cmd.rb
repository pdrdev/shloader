class Cmd

  # Execute a command
  def self.execute(command, debug = false)
    debug_mode_message = if debug then ' (in debug mode)' else '' end
    Logger.log "Executing command#{debug_mode_message}: #{command}"
    output = ''
    # 2>&1 is used to redirect stderr to stdout
    if !debug
      output = p `#{command} 2>&1`
      Logger.log "Command output: #{output}"
    end
    output
  end
end