require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Game do
  context '#initialize' do
    it 'exists' do
      game = Game.new

      expect(game).to be_instance_of(Game)
    end

    it 'has attributes' do
      game = Game.new

      expect(game.human[:board]).to be_instance_of(Board)
      expect(game.robot[:board]).to be_instance_of(Board)
    end
  end

  context '#start' do
    # lol i have no idea how to test this.
  end

  context '#display_clear' do
    # lol i have no idea how to test this.
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

  context '#turn' do
    xit 'displays the boards' do
      # in the terminal.
    end
  end

  context '#player_ships_sunk?(player)' do
    it 'returns true when all ships sunk' do
      game    = Game.new
      human = game.human
      cruiser = human[:ships][0]
      submarine = human[:ships][1]
      human[:board].place(cruiser, ["A1", "A2", "A3"])
      human[:board].place(submarine, ["B3", "B4"])

      robot = game.robot
      human[:board].fire_upon("A1")
      human[:board].fire_upon("A2")
      human[:board].fire_upon("A3")

      expect(game.player_ships_sunk?(human)).to be(false)

      human[:board].fire_upon("B3")
      human[:board].fire_upon("B4")

      expect(game.player_ships_sunk?(human)).to be(true)
    end
  end

  context '#congratulate_winner(winner)' do
    it 'can congratulate human' do
      game    = Game.new
      human = game.human
      robot = game.robot
      winner = human

      expect(game.congratulate_winner(winner)).to eq(game.human_winner)
    end

    it 'can congratulate robot' do
      game    = Game.new
      human = game.human
      robot = game.robot
      winner = robot

      expect(game.congratulate_winner(winner)).to eq(game.robot_winner)
    end
  end

  context '#winner' do
    it 'human can win' do
      game    = Game.new
      human = game.human
      robot = game.robot
      cruiser = robot[:ships][0]
      submarine = robot[:ships][1]
      robot[:board].place(cruiser, ["A1", "A2", "A3"])
      robot[:board].place(submarine, ["B3", "B4"])

      robot[:board].fire_upon("A1")
      robot[:board].fire_upon("A2")
      robot[:board].fire_upon("A3")

      expect(game.player_ships_sunk?(robot)).to be(false)

      robot[:board].fire_upon("B3")
      robot[:board].fire_upon("B4")

      expect(game.player_ships_sunk?(robot)).to be(true)

      expect(game.winner).to eq(game.human)
    end

    it 'robot can win' do
      game    = Game.new
      human = game.human
      robot = game.robot
      cruiser = human[:ships][0]
      submarine = human[:ships][1]
      human[:board].place(cruiser, ["A1", "A2", "A3"])
      human[:board].place(submarine, ["B3", "B4"])

      human[:board].fire_upon("A1")
      human[:board].fire_upon("A2")
      human[:board].fire_upon("A3")

      expect(game.player_ships_sunk?(human)).to be(false)

      human[:board].fire_upon("B3")
      human[:board].fire_upon("B4")

      expect(game.player_ships_sunk?(human)).to be(true)

      expect(game.winner).to eq(game.robot)
    end
  end











  # Player class -----------------------------------
  context '#place_robot_ship' do
    xit 'places robot ship only if possible' do
      game    = Game.new
      ship = game.robot[:ships][0]

      game.place_robot_ship(ship)
      # can't test. this is random.
    end
  end



  # Human class ------------------------------------
  context '#place_human_ships(ship)' do
    # requires human input. destroy all humans.
  end

  context '#get_human_placement(ship)' do
    # requires human input. destroy all humans.
  end




  # Robot class -----------------------------------
  context '#place_robot_ships(ships)' do
    it 'places robot ship only if possible' do
      game    = Game.new
      ships = game.robot[:ships]

      game.place_robot_ships(ships)
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

end
