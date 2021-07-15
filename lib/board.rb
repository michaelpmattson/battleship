require './lib/cell'

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

  def valid_cells?(coordinates)
    coordinates.all? { |coordinate| validate_coordinate?(coordinate)}
  end

  def valid_placement?(ship, coordinates)
    valid_length?(ship, coordinates) && consecutive_coordinates?(coordinates) && valid_cells?(coordinates) && no_ship(coordinates)
  end

  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def consecutive_coordinates?(coordinates)
    if coordinates.all? { |coordinate| coordinate[0] == coordinates[0][0] }
      consecutive_numbers?(coordinates)
    elsif coordinates.all? { |coordinate| coordinate[1] == coordinates[0][1] }
      consecutive_letters?(coordinates)
    else
      false
    end
  end

  def consecutive_numbers?(coordinates)
    numbers = coordinates.map { |coordinate| coordinate[1] }
    numbers == (numbers.first..numbers.last).to_a
  end

  def consecutive_letters?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    letters == (letters.first..letters.last).to_a
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def no_ship(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].empty? }
  end
end
