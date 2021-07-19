require './lib/player'

RSpec.describe Player do
  context '#initialize' do
    it 'exists' do
      player = Player.new
      
      expect(player).to be_an_instance_of(Player)
    end
    
    it 'has attributes' do
      player = Player.new

      expect(player.board).to be_an_instance_of(Board)
      expect(player.ships).to be_an_instance_of(Array)
      player.ships.each do |ship| 
        expect(ship).to be_an_instance_of(Ship)
      end
      expect(player.shots_fired).to eq([])
    end
  end

  context '#place_ship(ship, coordinates)' do
    xit 'places ship only if possible' do
      player = Player.new
      ship   = player.ships[0]

      player.place_ship(ship, coordinates)

      # not sure how to test this
    end
  end

  context '#player_ships_sunk?(player)' do
    it 'returns true when all ships sunk' do
      game      = Game.new
      human     = game.human
      cruiser   = human[: ships][0]
      submarine = human[: ships][1]
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
end