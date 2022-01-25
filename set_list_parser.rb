require_relative './set_parser'

class SetListParser
  attr_reader :yaml

  def initialize(yaml)
    @yaml = yaml
  end

  def sets
    @sets ||= yaml.map.with_index { |set, i| SetParser.new(i, set) }
  end
end
