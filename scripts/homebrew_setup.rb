#!/usr/bin/env ruby

require_relative 'shared'

`which brew > /dev/null`
process_status = $?
if (!process_status.success?)
  colorize_log 'Installing HomeBrew'
  shell_cmd 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
elsif
  log 'Homebrew is already installed'
end

`brew cask > /dev/null`
process_status = $?
if (!process_status.success?)
  colorize_log 'Installing HomeBrew Cask'
  shell_cmd 'brew install caskroom/cask/brew-cask'
elsif
  log 'Homebrew cask is already installed'
end
