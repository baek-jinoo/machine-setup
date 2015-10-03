#!/usr/bin/env ruby

require_relative 'shared'

def install_dropbox
  app_name = 'Dropbox'
  if File.exists?("/Applications/#{app_name}.app") then
    colorize_log "#{app_name} Already Installed"
    return
  end
  colorize_log 'Installing Dropbox'
  shell_cmd 'curl -Lo /tmp/Dropbox.dmg https://www.dropbox.com/download?plat=mac;'
  shell_cmd 'hdiutil attach /tmp/Dropbox.dmg;'
  shell_cmd 'ditto -rsrc /Volumes/Dropbox\ Installer/Dropbox.app /Applications/Dropbox.app;'
  shell_cmd 'hdiutil detach /Volumes/Dropbox\ Installer/;'
  shell_cmd 'rm /tmp/Dropbox.dmg;'
end

install_dropbox
