# frozen_string_literal: true

require 'yaml'
require './destination_path'
require './set_list'
require './set_list_parser'

class SettingService
  attr_reader :yaml, :output, :destination_path

  def initialize(yaml, output=nil)
    @yaml = YAML.safe_load(File.read(yaml), symbolize_names: true)
    @output = output || 'intermediate.abc'
    @destination_path = DestinationPath.new.read_path
  end

  def perform
    File.open(destination_file, 'w') do |f|
      set_list = SetList.new(SetListParser.new(yaml)).template
      f.puts(set_list)
    end
  end

  def destination_file
    puts output
    puts destination_path
    @destination_file = File.expand_path(File.join(destination_path, output))
  end
end
