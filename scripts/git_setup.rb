#!/usr/bin/env ruby

require_relative 'shared'

def install_gitconfig
  settings_destination_full_path = "#{ENV['HOME']}/.gitconfig"
  colorize_log 'Attempting to install gitconfig'
  if !File.symlink?(settings_destination_full_path) && !File.exists?(settings_destination_full_path) then
    colorize_log 'Installing gitconfig'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/git/gitconfig #{settings_destination_full_path}" 
  else
    colorize_log 'gitconfig already installed'
  end
end

install_gitconfig
