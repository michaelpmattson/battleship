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

      expect(game.human).to be_instance_of(Human)
      expect(game.robot).to be_instance_of(Robot)
    end
  end

  # context '#start' do
  #   # lol i have no idea how to test this.
  # end

  # context '#display_clear' do
  #   # lol i have no idea how to test this.
  # end

  # context '#play?' do
  #   # lol i have no idea how to test this.
  # end

  # context '#play' do
  #   # lol i have no idea how to test this.
  # end

  # context '#setup' do
  #   # lol i have no idea how to test this.
  # end

  # context '#turn' do
  #   xit 'displays the boards' do
  #     # in the terminal.
  #   end
  # end

  context '#congratulate_winner(winner)' do
    it 'can congratulate human' do
      game   = Game.new
      human  = game.human
      robot  = game.robot
      winner = human

      expect(game.congratulate_winner(winner)).to eq(game.human_winner)
    end

    it 'can congratulate robot' do
      game   = Game.new
      human  = game.human
      robot  = game.robot
      winner = robot

      expect(game.congratulate_winner(winner)).to eq(game.robot_winner)
    end
  end

  context '#winner' do
    it 'human can win' do
      game      = Game.new
      human     = game.human
      robot     = game.robot
      cruiser   = robot.ships[0]
      submarine = robot.ships[1]
      robot.board.place(cruiser, ["A1", "A2", "A3"])
      robot.board.place(submarine, ["B3", "B4"])

      robot.board.fire_upon("A1")
      robot.board.fire_upon("A2")
      robot.board.fire_upon("A3")

      expect(game.robot.ships_sunk?).to be(false)

      robot.board.fire_upon("B3")
      robot.board.fire_upon("B4")

      expect(game.robot.ships_sunk?).to be(true)

      expect(game.winner).to eq(game.human)
    end

    it 'robot can win' do
      game      = Game.new
      human     = game.human
      robot     = game.robot
      cruiser   = human.ships[0]
      submarine = human.ships[1]
      human.board.place(cruiser, ["A1", "A2", "A3"])
      human.board.place(submarine, ["B3", "B4"])

      human.board.fire_upon("A1")
      human.board.fire_upon("A2")
      human.board.fire_upon("A3")

      expect(game.human.ships_sunk?).to be(false)

      human.board.fire_upon("B3")
      human.board.fire_upon("B4")

      expect(game.human.ships_sunk?).to be(true)

      expect(game.winner).to eq(game.robot)
    end
  end
end
