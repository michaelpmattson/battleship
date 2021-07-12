require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  context '#initialize' do
    it 'exists' do
      cell = Cell.new("B4")

      expect(cell).to be_a(Cell)
    end

    it 'has a coordinate' do
      cell = Cell.new("B4")
      
      expect(cell.coordinate).to eq("B4")
    end

    it 'starts with no ship' do
      cell = Cell.new("B4")
      
      expect(cell.ship).to be_nil 
    end
  end

  context '#empty?' do
    it 'starts empty' do
      cell = Cell.new("B4")
      
      expect(cell.empty?).to be(true)
    end
  end

  context '#place_ship' do
    it 'places a ship on the cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      expect(cell.ship).to be(cruiser)
    end

    it 'fills the cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      expect(cell.empty?).to be(false)
    end

    it 'can not place if not empty' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")
    
      cell.place_ship(cruiser)

      expect(cell.ship).to be(cruiser)

      submarine = Ship.new("Submarine", 2)

      cell.place_ship(submarine)

      expect(cell.ship).to be(cruiser)
    end
  end
end