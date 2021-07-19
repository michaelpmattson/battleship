
require './lib/robot'
require './lib/ship'

RSpec.describe Robot do
  context "initialize" do
    it 'exists' do
      robot = Robot.new

      expect(robot).to be_an_instance_of(Robot)
    end
  end

  #  context '#place_ships(ships)' do
  #   it 'places robot ship only if possible' do
  #     robot = Robot.new
  #     ships = robot.ships
  #
  #     robot.place_ships(ships)
  #     # can't test. cells and dir are random.
  #   end
  # end

  # context '#place_ship(ship)' do
  #   xit 'places ship only if possible' do
  #     robot = Robot.new
  #     ship   = robot.ships[0]
  #
  #     robot.place_ship(ship)
  #
  #     # not sure how to test this
  #   end
  # end

  # context '#get_robot_placement' do
  #
  # end

  # context '#random_cell_num' do
  #   it 'random cell' do
  #     game = Game.new
  #     game.random_cell_num
  #     # expect(game.random_cell_num).to eq(  i dunnoooooooo
  #   end
  # end

  context '#zero_or_one' do
    it 'is zero or one' do
      robot = Robot.new
      num  = robot.zero_or_one

      expect(num == 0 || num == 1).to be(true)
    end
  end

  context '#orient_right(ship, cell_num)' do
    it 'adds cells to the right' do
      robot      = Robot.new
      cruiser    = Ship.new("Cruiser", 3)
      cell_num_1 = "A1"
      cell_num_2 = "AB12"

      expect(robot.orient_right(cruiser, cell_num_1)).to eq(["A1", "A2", "A3"])
      expect(robot.orient_right(cruiser, cell_num_2)).to eq(["AB12", "AB13", "AB14"])
    end
  end

  context '#orient_down(cell)' do
    it 'adds cells down' do
      robot      = Robot.new
      cruiser    = Ship.new("Cruiser", 3)
      cell_num_1 = "A1"
      cell_num_2 = "AB12"

      expect(robot.orient_down(cruiser, cell_num_1)).to eq(["A1", "B1", "C1"])
      expect(robot.orient_down(cruiser, cell_num_2)).to eq(["AB12", "AC12", "AD12"])
    end
  end

  context '#alpha(cell_num)' do
    it 'alpha string' do
      robot = Robot.new

      expect(robot.alpha("AB12")).to eq("AB")
    end

  end

  context '#num(cell_num)' do
    it 'num string' do
      robot = Robot.new

      expect(robot.num("AB12")).to eq("12")
    end
  end
end
