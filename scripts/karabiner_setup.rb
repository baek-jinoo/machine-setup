#!/usr/bin/env ruby

#download karabiner
file_name = 'Karabiner-10.6.0.dmg'
temporary_file_location = "/tmp/#{file_name}"
`rm -rf #{temporary_file_location}`
`wget https://pqrs.org/osx/karabiner/files/#{file_name} -O #{temporary_file_location}`
#install karabiner

`hdiutil mount #{temporary_file_location}`
puts 'Install the pkg file'

