#!/usr/bin/env ruby

require_relative 'shared'

def install_vim
  name = 'vim'
  app_destination_full_path = "/usr/loca/bin/#{name}"
  if File.symlink?(app_destination_full_path) || File.exist?(app_destination_full_path) then
    colorize_log "#{name} already installed"
    return
  end
  colorize_log "Attempting to install #{name}"
  repository_url = 'https://github.com/vim/vim.git'
  command = 'cd src && \
             ./configure --prefix=/usr/local \
              --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-perlinterp \
              --enable-cscope && \
             make && \
             mv vim /usr/local/bin/vim'
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

def create_tmp_for_swp
  tmp_full_path = "#{settings_destination_full_path}/tmp"

  colorize_log 'Attempting to install swp tmp folder'
  if !File.directory?(tmp_full_path) then
    colorize_log "Installing swp tmp folder at #{tmp_full_path}"
    shell_cmd "mkdir -p #{tmp_full_path}"
  end
end

def install_vundle
  if !File.directory?("#{settings_destination_full_path}/bundle/Vundle.vim") then
    shell_cmd "git clone https://github.com/VundleVim/Vundle.vim.git #{settings_destination_full_path}/bundle/Vundle.vim"
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
install_vundle
create_tmp_for_swp

