#!/usr/bin/env ruby

require_relative 'shared'


def install_karabiner
  colorize_log 'Installing Karabiner'
  file_name = 'Karabiner-10.6.0.dmg'
  temporary_file_location = "/tmp/#{file_name}"
  `rm -rf #{temporary_file_location}`
  `wget https://pqrs.org/osx/karabiner/files/#{file_name} -O #{temporary_file_location}`
  #install karabiner
  
  `hdiutil mount #{temporary_file_location}`
end

def configure_karabiner
  colorize_log 'Configuring Karabiner'
  shell_cmd './scripts/karabiner/karabiner-config-import.sh'
end

install_karabiner
configure_karabiner

