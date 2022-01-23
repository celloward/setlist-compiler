class Pathway
  attr_reader :full_path, :storage_path

  def initialize
    @storage_path = storage_path
    @full_path = read_path
  end

  def save_path
    return unless full_path

    File.open(storage_path, "w") do |f|
      f.rewind
      f.puts(full_path)
      f.close
    end
  end

  def read_path
    return unless File.exists?(storage_path)

    File.open(storage_path, "r") do |f|
      f.rewind
      @full_path = f.read.chomp
    end
  end

  def format_path(path)
    path[0..1] == "~/" ? path : "~/" + path
  end

  def full_path=(path)
    @full_path = format_path(path)
  end
end
