#!/usr/bin/env ruby

require_relative 'shared'

def install_alfred
  colorize_log 'Installing Alfred'
  shell_cmd 'brew cask install alfred'
end

install_alfred
