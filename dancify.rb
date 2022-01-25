#!/usr/bin/env ruby

require_relative './setting_service'

SettingService.new(ARGV[0], ARGV[1]).perform
