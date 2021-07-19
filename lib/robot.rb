require './lib/player'

class Robot < Player
  def place_ships(ships)
    ships.each do |ship|
      place_ship(ship)
    end
  end

  def place_ship(ship)
    coordinates = get_coordinates(ship)

    if board.valid_placement?(ship, coordinates) # rest is same
      board.place(ship, coordinates)
    else
      place_ship(ship)
    end
  end

  def get_coordinates(ship)
    cell_num = random_cell_num
    choose_orientation(ship, cell_num)
  end

  def random_cell_num
    num = rand(board.cells.keys.count)
    board.cells.keys[num]
  end

  def zero_or_one
    rand(2)
  end

  def choose_orientation(ship, cell_num)
    zero_or_one == 0 ? orient_right(ship, cell_num) : orient_down(ship, cell_num)
  end

  def orient_right(ship, cell_num)
    ship_array = []
    alpha = alpha(cell_num)
    num = num(cell_num)
    ship.length.times do
      ship_array << alpha + num
      num.next!
    end
    ship_array
  end

  def orient_down(ship, cell_num)
    ship_array = []
    alpha = alpha(cell_num)
    num = num(cell_num)
    ship.length.times do
      ship_array << alpha + num
      alpha.next!
    end
    ship_array
  end

  def alpha(cell_num)
    cell_num.delete("0-9")
  end

  def num(cell_num)
    cell_num.delete("^0-9")
  end

  def choose_coordinate
    robot_shot = random_cell_num
    return choose_coordinate if shots_fired.include?(robot_shot)

    shots_fired << robot_shot
    robot_shot
  end
end
