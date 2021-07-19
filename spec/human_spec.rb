require './lib/human'
require './lib/ship'

RSpec.describe Human do
  context "initialize" do
    it 'exists' do
      human = Human.new

      expect(human).to be_an_instance_of(Human)
    end
  end

  # context '#place_human_ships(ship)' do
  #   # requires human input. destroy all humans.
  # end

  # context '#place_ship(ship, coordinates)' do
  #   xit 'places ship only if possible' do
  #     player = Player.new
  #     ship   = player.ships[0]
  #
  #     player.place_ship(ship, coordinates)
  #
  #     # not sure how to test this
  #   end
  # end

  # context '#get_human_placement(ship)' do
  #   # requires human input. destroy all humans.
  # end
end
