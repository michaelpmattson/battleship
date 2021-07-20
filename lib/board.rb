require './lib/cell'

class Board
  attr_reader :cells,
              :alpha_array

  def initialize
    @cells = {}
    @alpha_array = alpha_array # default ["A", "B", "C", "D"]
    make_cells(alpha_array)
  end

  def clear
    @cells.clear
  end

  def make_cells(array)
    val = array.each { |alpha| make_row(alpha, array) }
  end

  def make_row(alpha, array)
    count = 0
    array.length.times do
      count += 1
      key = make_key(alpha, count)
      add_to_cells(key)
    end
  end

  def alpha_array(length = 4)
    num = length - 1
    last = ("A".ord + num).chr
    @alpha_array = ("A"..last).to_a
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

  # Indexes are coordinate string indexes, i.e. "A1", "A2"
  # This method will only work for 2 character strings.
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
    coordinates.each { |coordinate| @cells[coordinate].place_ship(ship) }
  end

  def no_ship(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].empty? }
  end

  def render(arg = false)
    top_row + other_rows(arg)
  end

  def top_row
    "  #{nums_array.join(' ')} \n"
  end

  def other_rows(arg = false)
    string = ""
    @alpha_array.each do |alpha|
      string += "#{alpha} "
      nums_array.each do |num|
        if cells[alpha + num.to_s].ship.nil?
          string += "#{cells[alpha + num.to_s].render} "
        else
          string += "#{cells[alpha + num.to_s].render(arg)} "
        end
      end
      string += "\n"
    end
    string
  end

  def nums_array
    (1..@alpha_array.length).to_a
  end

  def fire_upon(coordinate)
    @cells[coordinate].fire_upon
  end
end
