#!/usr/bin/env ruby

require_relative '../setting_service'

setlist = ARGV[0]
output = ARGV[1] || '~/intermediate.abc'

SettingService.new(setlist, output).perform

puts "Set created in #{output}"
