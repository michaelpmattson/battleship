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

  context '#ships_sunk?' do
    it 'returns true when all ships sunk' do
      player = Player.new
      cruiser   = player.ships[0]
      submarine = player.ships[1]
      player.board.place(cruiser, ["A1", "A2", "A3"])
      player.board.place(submarine, ["B3", "B4"])

      player.board.fire_upon("A1")
      player.board.fire_upon("A2")
      player.board.fire_upon("A3")

      expect(player.ships_sunk?).to be(false)

      player.board.fire_upon("B3")
      player.board.fire_upon("B4")

      expect(player.ships_sunk?).to be(true)
    end
  end
end
