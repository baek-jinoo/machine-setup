#!/usr/bin/env ruby

require_relative 'shared'

def clone_git_repository(repository_url, target_directory)
  shell_cmd "mkdir -p #{target_directory}"
  colorize_log "Cloning [#{repository_url}] into [#{target_directory}]"
  shell_cmd "cd #{target_directory} && git clone #{repository_url}"
end

def install_gem(name)
  begin
    gem name
  rescue Gem::LoadError
    colorize_log "Installing gem #{name}"
    shell_cmd "gem install #{name} --no-ri --no-rdoc"
  end
end

def install(name, target_directory, command)
  current_directory = Dir.pwd
  Dir.chdir "#{target_directory}/#{name}"
  colorize_log "Installing #{name}"
  shell_cmd command
  Dir.chdir current_directory
end

def install_with_git_repository(name, repository_url)
  target_directory = "/tmp/__installs/#{name}"
  log "Clearing #{target_directory}"
  shell_cmd "rm -rf #{target_directory}"
  clone_git_repository(repository_url, target_directory)
  install_gem('rake')
  install(name, target_directory, 'rake install')
end

def install_cedar_shortcuts
  name = 'CedarShortcuts'
  repository_url = 'https://github.com/cppforlife/CedarShortcuts.git'
  install_with_git_repository(name, repository_url)
end

def install_better_console
  name = 'BetterConsole'
  repository_url = 'https://github.com/cppforlife/BetterConsole.git'
  install_with_git_repository(name, repository_url)
end

install_cedar_shortcuts
install_better_console

