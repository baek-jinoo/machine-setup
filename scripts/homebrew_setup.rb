#!/usr/bin/env ruby

require_relative 'shared'

`which brew > /dev/null`
process_status = $?
if (!process_status.success?)
  shell_cmd 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
elsif
  log 'Homebrew is already installed'
end
