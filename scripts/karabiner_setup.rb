#!/usr/bin/env ruby

require_relative 'shared'


def install_karabiner
  app_name = 'Karabiner'
  if File.exists?("/Applications/#{app_name}.app") then
    colorize_log "#{app_name} Already Installed"
    return
  end
  colorize_log "Installing #{app_name}"
  pkg_name = "#{app_name}.sparkle_guided.pkg"
  file_name = "#{app_name}-10.9.0"
  file_name_with_dmg = "#{file_name}.dmg"
  temporary_file_location = "/tmp/#{file_name_with_dmg}"
  shell_cmd "rm -rf #{temporary_file_location}"
  shell_cmd "wget https://pqrs.org/osx/karabiner/files/#{file_name_with_dmg} -O #{temporary_file_location}"
  #install karabiner
  
  shell_cmd "hdiutil attach #{temporary_file_location}"
  volume_location = "/Volumes/#{file_name}"
  shell_cmd "sudo /usr/sbin/installer -pkg #{volume_location}/#{pkg_name} -target /"
  shell_cmd "hdiutil detach #{volume_location}"

end

def configure_karabiner
  colorize_log 'Configuring Karabiner'
  shell_cmd './scripts/karabiner/karabiner-config-import.sh'
end

install_karabiner
configure_karabiner
red_log 'Enable Accessibility by Opening Karabiner'

