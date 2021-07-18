require './lib/robot'

RSpec.describe Robot do
  context "initialize" do  
    it 'exists' do
      robot = Robot.new

      expect(robot).to be_an_instance_of(Robot)
    end
  end

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