#!/usr/bin/env ruby

require_relative 'shared'

def install_gem(name)
  begin
    gem name
  rescue Gem::LoadError
    colorize_log "Installing gem #{name}"
    shell_cmd "gem install #{name} --no-ri --no-rdoc"
  end
end

def install_cedar_shortcuts
  name = 'CedarShortcuts'
  repository_url = 'https://github.com/cppforlife/CedarShortcuts.git'
  install_gem('rake')
  install_with_git_repository(name, repository_url, 'rake install')
end

def install_better_console
  name = 'BetterConsole'
  repository_url = 'https://github.com/cppforlife/BetterConsole.git'
  install_gem('rake')
  install_with_git_repository(name, repository_url, 'rake install')
end

def install_xcode_preferences
  name = 'XcodePreferences'
  repository_url = 'https://github.com/baek-jinoo/XcodePreferences.git'
  install_gem('rake')
  install_with_git_repository(name, repository_url, 'rake')
end

def install_appcode_preferences
  name = 'AppCodePreferences'
  repository_url = 'https://github.com/baek-jinoo/AppCodePreferences.git'
  install_gem('rake')
  install_with_git_repository(name, repository_url, 'rake symlink:all')
end

def install_alcatraz
  colorize_log "Installing Alcatraz for Xcode"
  shell_cmd 'curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh'
end

def install_xcode_snippets
  colorize_log "Installing Xcode snippets"
  shell_cmd "cp #{File.expand_path(File.dirname(__FILE__))}/../artifacts/xcode_snippets/* ~/Library/Developer/Xcode/UserData/CodeSnippets"
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
install_xcode_snippets
#install_dash
