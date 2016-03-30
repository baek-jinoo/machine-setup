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

def install_git_branch_autocomplete
  settings_destination_full_path = "#{ENV['HOME']}/.git-completion.bash"
  colorize_log 'Attempting to install git branch autocomplete'
  if !File.symlink?(settings_destination_full_path) && !File.exists?(settings_destination_full_path) then
    colorize_log 'Installing git branch autocomplete'
    shell_cmd "curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o #{settings_destination_full_path}"
    shell_cmd 'echo "if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi" >> ~/.bashrc'
  else
    colorize_log 'gitconfig already installed'
  end
end

def install_git_bash_prompt
  shell_cmd "brew update"
  shell_cmd "brew install bash-git-prompt"
end

install_gitconfig
install_git_branch_autocomplete
install_git_bash_prompt
