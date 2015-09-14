#!/usr/bin/env ruby

require_relative 'shared'

def install_vim_directory
  settings_destination_full_path = "#{ENV['HOME']}/.vim"
  colorize_log 'Attempting to install .vim directory'
  if !File.symlink?(settings_destination_full_path) && !File.directory?(settings_destination_full_path) then
    colorize_log 'Installing .vim directory'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/vim/vim #{settings_destination_full_path}" 
  else
    colorize_log '.vim directory already installed'
  end
end

def install_vundle
  if !File.directory?("#{ENV['HOME']}/.vim/bundle/Vundle.vim") then
    shell_cmd "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
  end
end

def install_vimrc
  settings_destination_full_path = "#{ENV['HOME']}/.vimrc"
  colorize_log 'Attempting to install .vimrc'
  if !File.symlink?(settings_destination_full_path) && !File.exists?(settings_destination_full_path) then
    colorize_log 'Installing .vimrc'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/vim/vimrc #{settings_destination_full_path}" 
  else
    colorize_log '.vimrc already installed'
  end
end

install_vim_directory
install_vimrc
install_vundle
