require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Game do
  context '#inxitialize' do
    it 'exists' do
      game    = Game.new

      expect(game).to be_instance_of(Game)
    end

    it 'has attributes' do
      game    = Game.new

      expect(game.human[:board]).to be_instance_of(Board)
      expect(game.robot[:board]).to be_instance_of(Board)
      expect(game.shots_fired).to eq([])
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

  context '#place_robot_ships(ships)' do
    it 'places robot ship only if possible' do
      game    = Game.new
      ships = game.robot[:ships]

      game.place_robot_ships(ships)
      # can't test. this is random.
    end
  end

  context '#place_robot_ship' do
    xit 'places robot ship only if possible' do
      game    = Game.new
      ship = game.robot[:ships][0]

      game.place_robot_ship(ship)
      # can't test. this is random.
    end
  end

  context '#get_robot_placement' do

  end

  context '#random_cell_num' do
    it 'random cell' do
      game    = Game.new
      game.random_cell_num
      # expect(game.random_cell_num).to eq(  i dunnoooooooo
    end
  end

  context '#zero_or_one' do
    it 'is zero or one' do
      game = Game.new
      num = game.zero_or_one

      expect(num == 0 || num == 1).to be(true)
    end
  end

  context '#orient_right(ship, cell_num)' do
    it 'adds cells to the right' do
      game       = Game.new
      cruiser    = Ship.new("Cruiser", 3)
      cell_num_1 = "A1"
      cell_num_2 = "AB12"

      expect(game.orient_right(cruiser, cell_num_1)).to eq(["A1", "A2", "A3"])
      expect(game.orient_right(cruiser, cell_num_2)).to eq(["AB12", "AB13", "AB14"])
    end
  end

  context '#orient_down(cell)' do
    it 'adds cells down' do
      game       = Game.new
      cruiser    = Ship.new("Cruiser", 3)
      cell_num_1 = "A1"
      cell_num_2 = "AB12"

      expect(game.orient_down(cruiser, cell_num_1)).to eq(["A1", "B1", "C1"])
      expect(game.orient_down(cruiser, cell_num_2)).to eq(["AB12", "AC12", "AD12"])
    end
  end

  context '#alpha(cell_num)' do
    it 'alpha string' do
      game = Game.new

      expect(game.alpha("AB12")).to eq("AB")
    end

  end

  context '#num(cell_num)' do
    it 'num string' do
      game = Game.new

      expect(game.num("AB12")).to eq("12")
    end
  end

  context '#place_human_ships(ship)' do
    # requires human input. destroy all humans.
  end

  context '#get_human_placement(ship)' do
    # requires human input. destroy all humans.
  end

  context '#get_human_placement(ship)' do
    # requires human input. destroy all humans.
  end

  context '#human_turn_prompt' do
    it 'human_turn_prompt' do
      game    = Game.new

      expect(game.human_turn_prompt).to eq("I have laid out my ships on the grid.\nYou now need to lay out your two ships.")
    end
  end

  context '##ship_list' do
    it 'ship_list' do
      game    = Game.new

      expect(game.ship_list).to eq("The Cruiser is three units long and the Submarine is two units long.")
    end
  end

  context '#enter_coordinates(ship)' do
    it 'returns enter_coordinates instruction' do
      game    = Game.new
      ship = game.human[:ships][0]
      spaces = ship.length

      expect(game.enter_coordinates(ship)).to eq("Enter the squares for the #{ship.name} (#{ship.length} spaces):")
    end
  end

  context '#turn' do
    it 'displays the boards' do
      # in the terminal.
      game = Game.new

      game.turn
    end
  end


end
