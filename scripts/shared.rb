#!/usr/bin/env ruby

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end
end

def shell_cmd(command)
  log "Executing command: [#{command}]"
  `#{command}`
  process_status = $?
  raise process_status.to_s unless process_status.success?
end

def log(message)
  puts "[INFO] - #{message}"
end

def red_log(message)
  log message.red
end

def colorize_log(message)
  log message.green
end


