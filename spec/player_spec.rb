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
      ship = player.ships[0]

      player.place_ship(ship, coordinates)

      # not sure how to test this
    end
  end
end