require_relative './set'

module Parsers
  class SetList
    attr_reader :yaml

    def initialize(yaml)
      @yaml = yaml
    end

    def sets
      @sets ||= yaml.map.with_index { |set, i| Parsers::Set.new(i, set) }
    end
  end
end
