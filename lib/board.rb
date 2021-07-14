class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def make_cells

  end

  def make_row(alpha)
    count = 0
    alpha_array.length.times do
      count += 1
      key = make_key(alpha, count)
      add_to_cells(key)
    end
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