#!/usr/bin/env ruby

require_relative 'shared'

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

def setup_dash_for_xcode
  name = 'Dash-Plugin-for-Xcode'
  repository_url = 'https://github.com/omz/Dash-Plugin-for-Xcode.git'
  install_with_git_repository(name, repository_url, 'xcrun xcodebuild')
end

setup_dash_for_xcode
