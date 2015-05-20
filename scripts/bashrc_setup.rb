#!/usr/bin/env ruby

require_relative 'shared'

def install_mybashrc
  settings_destination_full_path = "#{ENV['HOME']}/.mybashrc"
  colorize_log 'Attempting to install mybashrc'
  if !File.symlink?(settings_destination_full_path) && !File.exists?(settings_destination_full_path) then
    colorize_log 'Installing mybashrc'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/bash/mybashrc #{settings_destination_full_path}" 
    shell_cmd 'echo "if [ -f ~/.mybashrc ]; then source ~/.mybashrc; fi" >> ~/.bash_profile'
  else
    colorize_log 'bashrc already installed'
  end
end

def install_bashrc
  colorize_log 'Installing bashrc'
  shell_cmd 'touch ~/.bashrc'
end

install_mybashrc
install_bashrc
