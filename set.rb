require_relative './tune'
class Set
  attr_reader :set, :last_page

  def initialize(set, last_page: false)
    @set = set
    @last_page = last_page
  end

  def template
    @template = <<~TEMPLATE
      #{ordering}
      #{titling}
      #{tunes}
      #{endmatter}
    TEMPLATE
  end

  def ordering
    "X: #{set.order}"
  end

  def titling
    "T: #{set.order + 1}. #{set.title} #{set.type}"
  end

  def endmatter
    '%%newpage' unless last_page
  end

  def tunes
    set.tunes.map { |tune| Tune.new(tune).read }.join("\n")
  end
end
