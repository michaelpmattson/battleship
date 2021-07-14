class Board
  attr_reader :cells

  def initialize
    @cells = {}
    make_cells(alpha_array)
  end

  def make_cells(array)
    val = array.each { |alpha| make_row(alpha) }
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

  def validate_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end
end
