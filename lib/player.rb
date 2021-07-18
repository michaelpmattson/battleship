require './lib/board'
require './lib/ship'

class Player 
  attr_reader :board, 
              :ships,
              :shots_fired

  def initialize
    @board = Board.new
    @ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @shots_fired = []
  end

  def place_ship(ship, coordinates)
    # coordinates = get_robot_placement(ship) # remove and make a get coordinates method in robot class

    if board.valid_placement?(ship, coordinates) # rest is same
      board.place(ship, coordinates)
    else
      place_ship(ship, coordinates)
    end
  end

  # def place_human_ship(ship)
  #   coordinates = get_human_placement(ship) # remove and make a get coordinates method in human class

  #   if human[:board].valid_placement?(ship, coordinates)
  #     human[:board].place(ship, coordinates)
  #   else
  #     place_human_ship(ship)
  #   end
  # end

  def ships_sunk?
    ships.all? { |ship| ship.sunk? }
  end
end