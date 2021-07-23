# frozen_string_literal: true

require 'yaml'

def perform
  scheme = YAML.safe_load(File.read(ARGV[0]), symbolize_names: true)
  filename = ARGV[1] || './intermediate.abc'
  File.open(File.expand_path("#{filename}.abc"), 'w') do |f|
    f.puts('%%scale 0.7')
    scheme.each_with_index do |set, i|
      f.puts("X: #{i}")
      f.puts("T: #{i + 1}. #{set[:set]} #{set[:type]}")
      expanded = set[:tunes].map { |tune| File.read(File.expand_path("#{tune}.abc")) }.join("\n")
      f.puts(expanded)
      f.puts('%%newpage') unless i == scheme.count - 1
    end
  end
end

perform
