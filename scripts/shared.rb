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

def clone_git_repository(repository_url, target_directory)
  shell_cmd "mkdir -p #{target_directory}"
  colorize_log "Cloning [#{repository_url}] into [#{target_directory}]"
  shell_cmd "cd #{target_directory} && git clone #{repository_url}"
end

def install(name, target_directory, command)
  current_directory = Dir.pwd
  Dir.chdir "#{target_directory}/#{name}"
  colorize_log "Installing #{name}"
  shell_cmd command
  Dir.chdir current_directory
end

def install_with_git_repository(name, repository_url, command)
  target_directory = "/tmp/__installs/#{name}"
  log "Clearing #{target_directory}"
  shell_cmd "rm -rf #{target_directory}"
  clone_git_repository(repository_url, target_directory)
  install(name, target_directory, command)
end

