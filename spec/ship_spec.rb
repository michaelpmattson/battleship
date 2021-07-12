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

  context '#sunk?' do
    it 'starts as false' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to be(false)
    end

    it 'text' do
      cruiser = Ship.new("Cruiser", 3)

      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to be(false)

      cruiser.hit

      expect(cruiser.sunk?).to be(true)
    end
  end

  context '#hit' do
    it 'subtracts 1 from health' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)

      cruiser.hit

      expect(cruiser.health).to eq(2)
    end
  end
end
