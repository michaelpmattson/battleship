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

  def ships_sunk?
    ships.all? { |ship| ship.sunk? }
  end

  # player board cell values will be overwritten in the board class.
  def set_board_width(board_width)
    user_alpha_array = board.alpha_array(board_width)
    board.make_cells(user_alpha_array)
  end
end
