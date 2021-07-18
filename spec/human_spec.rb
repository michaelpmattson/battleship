require './lib/human'

RSpec.describe Human do
  context "initialize" do  
    it 'exists' do
      human = Human.new

      expect(human).to be_an_instance_of(Human)
    end
  end

  context '#place_human_ships(ship)' do
    # requires human input. destroy all humans.
  end

  context '#get_human_placement(ship)' do
    # requires human input. destroy all humans.
  end
end