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

      expect(game.human_board).to eq(board_1)
      expect(game.robot_board).to eq(board_2)
    end

    xit 'has a menu' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)

    end
  end

  context '#start' do
    # lol i have no idea how to test this.
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

  context '#play?' do
    # lol i have no idea how to test this.
  end

  context '#play' do
    # lol i have no idea how to test this.
  end

  context '#setup' do
    # lol i have no idea how to test this.
  end

  context '#get_robot_placement' do

  end

  context '#random_cell' do
    it 'random cell' do
      board_1 = Board.new
      board_2 = Board.new
      game    = Game.new(board_1, board_2)
      game.random_cell
      # expect(game.random_cell).to eq(  i dunnoooooooo
    end
  end

  context '#random_dir' do

  end
end
