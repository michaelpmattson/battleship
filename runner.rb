require './lib/game'
require './lib/board'

board_1 = Board.new
board_2 = Board.new
game    = Game.new(board_1, board_2)
game.start
