#!/usr/bin/env ruby

require_relative 'shared'

def change_modifier_keys
  colorize_log 'Changing modifier keys'
  shell_cmd 'osascript ./scripts/change_modifier_keys.scpt'
end

change_modifier_keys
