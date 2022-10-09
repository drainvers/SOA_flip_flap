# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  NEWLINE = "\n"
  TAB = "\t"

  def row_to_hash(header, row)
    header.zip(row).to_h
  end

  def take_tsv(tsv)
    temp_arr = tsv.split(NEWLINE).map { |elem| elem.split(TAB) }
    header = temp_arr.first
    rows = temp_arr[1..]
    @data = rows.map { |row| row_to_hash(header, row) }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data.first.keys.join(TAB)
    tsv_string = @data.map { |elem| elem.values.join(TAB) }.join(NEWLINE)
    header + NEWLINE + tsv_string + NEWLINE
  end
end
