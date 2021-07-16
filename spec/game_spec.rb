require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Game do
  context '#initialize' do
    it 'exists' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)

      expect(game).to be_instance_of(Game)
    end

    it 'has attributes' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)

      expect(game.user_board).to eq(board_1)
      expect(game.robot_board).to eq(board_2)
    end

    xit 'has a menu' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)

    end
  end

  context '#start' do
    
  end

  context '#display_clear' do
    # lol i have no idea how to test this.
  end

  context '#menu' do
    it 'returns menu' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)

      expect(game.menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end
  end
end
