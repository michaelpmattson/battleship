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
end