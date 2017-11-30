#!/usr/bin/env ruby

require_relative 'shared'

def install_vim
  name = 'macvim'
  app_destination_full_path = '/Applications/MacVim.app'
  if File.symlink?(app_destination_full_path) || File.exist?(app_destination_full_path) then
    colorize_log "#{name} already installed"
    return
  end
  colorize_log "Attempting to install #{name}"
  repository_url = 'https://github.com/macvim-dev/macvim.git'
  command = 'git checkout snapshot-137 &&\
             cd src && \
             ./configure --prefix=/usr/local \
              --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-python3interp=yes \
              --enable-perlinterp \
              --enable-cscope && \
             make && \
             mv MacVim/build/Release/MacVim.app /Applications/'
  install_with_git_repository(name, repository_url, command)
  colorize_log "Successfully installed #{name}"
end

def settings_destination_full_path
  "#{ENV['HOME']}/.vim"
end

def install_vim_directory
  colorize_log 'Attempting to install .vim directory'
  if !File.symlink?(settings_destination_full_path) && !File.directory?(settings_destination_full_path) then
    colorize_log 'Installing .vim directory'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/vim/vim #{settings_destination_full_path}" 
  else
    colorize_log '.vim directory already installed'
  end
end

def install_vimrc
  colorize_log 'Attempting to install .vimrc'
  vimrc_destination_full_path = settings_destination_full_path + "rc"
  if !File.symlink?(vimrc_destination_full_path) && !File.exists?(vimrc_destination_full_path) then
    colorize_log 'Installing .vimrc'
    shell_cmd "ln -s #{File.expand_path(File.dirname(__FILE__))}/../artifacts/vim/vimrc #{vimrc_destination_full_path}" 
  else
    colorize_log '.vimrc already installed'
  end
end

install_vim
install_vim_directory
install_vimrc

