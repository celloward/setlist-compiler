module Parsers
  class Set
    attr_reader :order, :set

    def initialize(order, set)
      @set = set
      @order = order
    end

    def title
      set[:set]
    end

    def type
      set[:type]
    end

    def tunes
      set[:tunes]
    end
  end
end
