require_relative './source_path'

class Tune
  attr_reader :source, :filename
  def initialize(filename)
    @source = SourcePath.new.read_path
    @filename = filename
  end

  def read
    File.read(source_file)
  end

  def source_file
    @source_file ||= File.expand_path(File.join("#{source}", "#{filename}.abc"))
  end
end
