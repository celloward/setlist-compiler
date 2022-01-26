require_relative './set'

class SetList
  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def sets
    @sets ||= parser_sets.map.with_index do |set, i|
      last_page = (i == parser_sets.count - 1)
      Set.new(set, last_page: last_page)
    end
  end

  def parser_sets
    @parser_sets ||= parser.sets
  end

  def template
    <<~TEMPLATE
      #{front_matter}
      #{sets.map(&:template).join("\n")}
    TEMPLATE
  end

  def front_matter
    '%%scale 0.7'
  end
end
