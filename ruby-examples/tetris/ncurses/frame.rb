class Frame
  def initialize(columns, rows)
    @columns, @rows = columns, rows
    @frame = Array.new(@rows) do
      Array.new(@columns) { ' ' }
    end
  end

  def set(col, row)
    @frame[row][col] = "#"
  end

  def to_s
    @frame.flatten.join
  end
end
