#!/usr/bin/env ruby

require_relative 'shared'

def install_seil
  shell_cmd 'brew update'
  colorize_log 'Installing Seil'
  shell_cmd 'brew cask install seil'
end

def setup_seil
  colorize_log 'Configuring Seil'
  shell_cmd './scripts/seil/seil-config-import.sh'
end

install_seil
setup_seil
