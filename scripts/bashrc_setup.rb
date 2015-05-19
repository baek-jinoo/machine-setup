#!/usr/bin/env ruby

require_relative 'shared'

def install_bashrc
  settings_destination_full_path = "#{ENV['HOME']}/.bashrc"
  colorize_log 'Attempting to install bashrc'
  if !File.symlink?(settings_destination_full_path) && !File.exists?(settings_destination_full_path) then
    colorize_log 'Installing bashrc'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/bash/bashrc #{settings_destination_full_path}" 
  else
    colorize_log 'bashrc already installed'
  end
end

install_bashrc
