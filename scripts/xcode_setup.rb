#!/usr/bin/env ruby

require_relative 'shared'

def clone_git_repository(repository_url, target_directory)
  shell_cmd "mkdir -p #{target_directory}"
  colorize_log "Cloning [#{repository_url}] into [#{target_directory}]"
  shell_cmd "cd #{target_directory} && git clone #{repository_url}"
end

def install_gem(name)
  begin
    gem name
  rescue Gem::LoadError
    colorize_log "Installing gem #{name}"
    shell_cmd "gem install #{name} --no-ri --no-rdoc"
  end
end

def install(name, target_directory, command)
  current_directory = Dir.pwd
  Dir.chdir "#{target_directory}/#{name}"
  colorize_log "Installing #{name}"
  shell_cmd command
  Dir.chdir current_directory
end

def install_with_git_repository(name, repository_url, command)
  target_directory = "/tmp/__installs/#{name}"
  log "Clearing #{target_directory}"
  shell_cmd "rm -rf #{target_directory}"
  clone_git_repository(repository_url, target_directory)
  install_gem('rake')
  install(name, target_directory, command)
end

def install_cedar_shortcuts
  name = 'CedarShortcuts'
  repository_url = 'https://github.com/cppforlife/CedarShortcuts.git'
  install_with_git_repository(name, repository_url, 'rake install')
end

def install_better_console
  name = 'BetterConsole'
  repository_url = 'https://github.com/cppforlife/BetterConsole.git'
  install_with_git_repository(name, repository_url, 'rake install')
end

def install_xcode_preferences
  name = 'XcodePreferences'
  repository_url = 'https://github.com/baek-jinoo/XcodePreferences.git'
  install_with_git_repository(name, repository_url, 'rake')
end

def install_appcode_preferences
  name = 'AppCodePreferences'
  repository_url = 'https://github.com/baek-jinoo/AppCodePreferences.git'
  install_with_git_repository(name, repository_url, 'rake symlink:all')
end

def install_alcatraz
  colorize_log "Installing Alcatraz for Xcode"
  shell_cmd 'curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh'
end

#def install_dash
#  colorize_log "Installing Dash"
#  shell_cmd 'brew cask install dash'
#end

install_cedar_shortcuts
install_better_console
install_alcatraz
install_xcode_preferences
install_appcode_preferences
#install_dash
