require './lib/ship'

RSpec.describe Ship do
  context '#initialize' do
    it 'exists' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_instance_of(Ship)
    end

    it 'has a name' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.name).to eq("Cruiser")
    end

    it 'has a length' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.length).to eq(3)
    end

    it 'has a health' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)
    end

    it 'starts with the same health as length' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)

      submarine = Ship.new("Submarine", 2)

      expect(submarine.health).to eq(2)
    end
  end
end
