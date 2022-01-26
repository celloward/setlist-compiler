#!/usr/bin/env ruby

require_relative '../lib/source/source_path'

path = ARGV[0]
s = SourcePath.new

if path
  s.full_path = path
  s.save_path
  puts "Current source path now #{s.full_path}"
else
  puts "No new path provided. Source path is still #{s.full_path}."
end
