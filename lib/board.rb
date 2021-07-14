class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def make_cells

  end

  def alpha_array
    ["A", "B", "C", "D"]
  end

  def make_key(alpha, count)
    alpha + count.to_s
  end

  def add_to_cells(key)
    @cells[key] = Cell.new(key)
  end
end
