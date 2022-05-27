require_relative './tune'
class Set
  attr_reader :set, :last_page

  def initialize(set, last_page: false)
    @set = set
    @last_page = last_page
  end

  # Only want to have a order and title if a title exists. Otherwise just the tune and new page
  def template
    @template = <<~TEMPLATE.prepend(frontmatter)
      #{tunes}
      #{endmatter}
    TEMPLATE
  end

  # Don't return frontmatter when no explicit set title
  def frontmatter
    return "" unless set.title

    <<~FRONTMATTER
      #{ordering}
      #{titling}
    FRONTMATTER
  end

  # Don't want extra X factors when only 1 tune is in set
  # It causes ABC not to interpret the tune which itself has an X factor
  def ordering
    return "" unless set.tunes.count > 1

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
