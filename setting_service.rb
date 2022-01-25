# frozen_string_literal: true

require 'yaml'
require_relative './set_list'
require_relative './set_list_parser'

class SettingService
  attr_reader :yaml, :output, :destination_path

  def initialize(yaml, output=nil)
    @yaml = YAML.safe_load(File.read(yaml), symbolize_names: true)
    @output = output || '~intermediate.abc'
  end

  def perform
    File.open(destination_file, 'w') do |f|
      set_list = SetList.new(SetListParser.new(yaml)).template
      f.puts(set_list)
    end
  end

  def destination_file
    @destination_file ||= File.expand_path(File.join(output))
  end
end
