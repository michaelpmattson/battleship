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

  context '#fired_upon?' do
    it 'checks if fired upon' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")

      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to be(false)
    end
  end

  context '#fire_upon' do
    it 'makes cell fired upon' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")

      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cell.fired_upon?).to be(true)
    end

    it 'makes ship health decrease by 1' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")

      cell.place_ship(cruiser)

      expect(cell.ship.health).to eq(3)

      cell.fire_upon

      expect(cell.ship.health).to eq(2)
    end

    it 'can not fire upon same cell twice' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")

      cell.place_ship(cruiser)

      cell.fire_upon

      expect(cell.ship.health).to eq(2)

      cell.fire_upon

      expect(cell.ship.health).to eq(2)
    end
  end

  context '#render' do
    it "returns '.' prior to being fired upon" do
      cell_1 = Cell.new("B4")

      expect(cell_1.render).to eq(".")
    end

    it "returns 'M' after fired upon and missed" do
      cell_1 = Cell.new("B4")

      expect(cell_1.render).to eq(".")

      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end

    it "returns 'H' if fired upon and hit" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq(".")

      cell_1.fire_upon

      expect(cell_1.render).to eq("H")
    end

    it "returns 'X' if fired upon and sunk" do
      cruiser = Ship.new("Cruiser", 3)
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("B3")
      cell_3 = Cell.new("B2")

      cell_1.place_ship(cruiser)
      cell_2.place_ship(cruiser)
      cell_3.place_ship(cruiser)

      cell_1.fire_upon
      cell_2.fire_upon

      expect(cell_1.render).to eq("H")
      expect(cell_2.render).to eq("H")
      expect(cell_3.render).to eq(".")

      cell_3.fire_upon

      expect(cell_1.render).to eq("X")
      expect(cell_2.render).to eq("X")
      expect(cell_3.render).to eq("X")
    end

    it "returns 'S' if true is passed in as optional arg" do
      cruiser = Ship.new("Cruiser", 3)
      cell_1 = Cell.new("B1")
      cell_2 = Cell.new("B2")
      cell_3 = Cell.new("B3")
      cell_4 = Cell.new("B4")

      cell_1.place_ship(cruiser)
      cell_2.place_ship(cruiser)
      cell_3.place_ship(cruiser)

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")
      expect(cell_3.render).to eq(".")

      expect(cell_1.render(true)).to eq("S")
      expect(cell_2.render(true)).to eq("S")
      expect(cell_3.render(true)).to eq("S")
      expect(cell_4.render(true)).to eq(".")
    end
  end

  context '#report' do
    it "returns a miss" do
      cell_1 = Cell.new("B4")

      cell_1.fire_upon

      expect(cell_1.report).to eq("Your shot on B4 was a miss.")
    end

    it "returns a hit" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell_1.place_ship(cruiser)

      cell_1.fire_upon

      expect(cell_1.report).to eq("Your shot on B4 was a hit.")
    end

    it "returns sunk" do
      cruiser = Ship.new("Cruiser", 3)
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("B3")
      cell_3 = Cell.new("B2")

      cell_1.place_ship(cruiser)
      cell_2.place_ship(cruiser)
      cell_3.place_ship(cruiser)

      cell_1.fire_upon
      cell_2.fire_upon

      expect(cell_1.report).to eq("Your shot on B4 was a hit.")
      expect(cell_2.report).to eq("Your shot on B3 was a hit.")

      cell_3.fire_upon

      expect(cell_1.report).to eq("You sunk my Cruiser.")
      expect(cell_2.report).to eq("You sunk my Cruiser.")
      expect(cell_3.report).to eq("You sunk my Cruiser.")
    end
  end
end
