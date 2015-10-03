#!/usr/bin/env ruby

require_relative 'shared'

def install_iterm2
  colorize_log 'Installing iTerm 2'
  shell_cmd 'brew cask install iterm2'
end

settings_file_name = 'com.googlecode.iterm2.plist'
settings_destination_directory = "#{ENV['HOME']}/.iterm"
settings_destination_full_path = "#{settings_destination_directory}/#{settings_file_name}"

shell_cmd "mkdir #{settings_destination_directory}" unless File.exists?(settings_destination_directory)

shell_cmd "ln -s #{Dir.pwd}/../artifacts/iterm/#{settings_file_name} #{settings_destination_full_path}" unless File.symlink?(settings_destination_full_path)

red_log "Set '#{settings_destination_directory}/' in iTerm's Preferences -> General -> Preferences"

install_iterm2
