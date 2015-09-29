#!/usr/bin/env ruby

require_relative 'shared'

def install_karabiner
  shell_cmd 'brew update'
  colorize_log 'Installing Karabiner'
  shell_cmd 'brew cask install karabiner'
end

def configure_karabiner
  colorize_log 'Configuring Karabiner'
  shell_cmd './scripts/karabiner/karabiner-config-import.sh'
end

install_karabiner
configure_karabiner

