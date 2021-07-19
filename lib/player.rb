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
end
