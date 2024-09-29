# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  attr_accessor :data


  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    lines = tsv.split("\n")
    headers = lines.first.split("\t")
    @data = lines[1..].map do |line|
      values = line.split("\t")
      Hash[headers.zip(values)]
    end
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    headers = @data.first.keys.join("\t")
    rows = @data.map { |row| row.values.join("\t") }
    "#{([headers] + rows).join("\n").rstrip}\n"
  end
end
