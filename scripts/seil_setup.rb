#!/usr/bin/env ruby

require_relative 'shared'

def install_seil
  shell_cmd 'brew update'
  colorize_log 'Installing Seil'
  shell_cmd 'brew cask install seil'
end

install_seil
