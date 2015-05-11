#!/usr/bin/env ruby

require_relative 'shared'

settings_file_name = 'com.googlecode.iterm2.plist'
settings_destination_directory = "#{ENV['HOME']}/.iterm"
settings_destination_full_path = "#{settings_destination_directory}/#{settings_file_name}"

shell_cmd "mkdir #{settings_destination_directory}" unless File.exists?(settings_destination_directory)

shell_cmd "ln -s #{Dir.pwd}/../artifacts/iterm/#{settings_file_name} #{settings_destination_full_path}" unless File.exists?(settings_destination_full_path)

red_log "Set '#{settings_destination_directory}/' in iTerm's Preferences -> General -> Preferences"
