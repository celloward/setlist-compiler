require './pathway'

class SourcePath < Pathway
  def initialize
    @storage_path = 'source_path'.freeze
  end
end
