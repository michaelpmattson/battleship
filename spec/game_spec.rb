require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Game do
  context '#initialize' do
    it 'exists' do
      game    = Game.new

      expect(game).to be_instance_of(Game)
    end

    it 'has attributes' do
      game    = Game.new

      expect(game.human_board).to be_instance_of(Board)
      expect(game.robot_board).to be_instance_of(Board)
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
      game    = Game.new

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
      game    = Game.new
      game.random_cell
      # expect(game.random_cell).to eq(  i dunnoooooooo
    end
  end

  context '#zero_or_one' do
    it 'is zero or one' do
      game = Game.new
      num = game.zero_or_one

      expect(num == 0 || num == 1).to be(true)
    end
  end
end
