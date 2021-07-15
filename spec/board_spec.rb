require './lib/board'
require './lib/ship'

RSpec.describe Board do
  context '#initialize' do
    it 'exists' do
      board = Board.new

      expect(board).to be_instance_of(Board)
    end

    it 'has a cells hash with Cell objects as values' do
      board = Board.new

      expect(board.cells).to be_a(Hash)

      cell_values = board.cells.values # an array
      all_cells = cell_values.all? { |value| value.class == Cell } # t or f

      expect(all_cells).to be(true) # confirms all values are Cell objects
    end
  end

  context '#make_cells' do
    it '#adds all rows to hash' do
      board = Board.new


      board.make_cells(board.alpha_array)

      expect(board.cells.keys).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4" ,"D1", "D2", "D3", "D4"])

      board.cells.each do |coordinate, cell|
        expect(cell).to be_instance_of(Cell)
      end
    end
  end

  context 'alpha_array' do
    it 'makes an array of strings from A to D' do
      board = Board.new
      alpha = board.alpha_array

      expect(alpha).to eq(["A", "B", "C", "D"])
    end
  end

  context '#make_key(alpha, count)' do
    it 'combines alpha string and count integer to key string' do
      board = Board.new
      alpha = "A"
      count = 1

      key = board.make_key(alpha, count)

      expect(key).to eq("A1")
    end
  end

  context '#add_to_cells(key)' do
    # it 'adds a new key to hash' do
    #   board = Board.new
    #   key_1 = "A1"
    #
    #   expect(board.cells.keys.include?("A1")).to be(false)
    #
    #   board.add_to_cells(key_1)
    #
    #   expect(board.cells.keys.include?("A1")).to be(true)
    # end

    # not sure how to test this yet.
    it 'adds only new Cell objects as values' do

    end
  end

  context '#make_row(alpha)' do
    it 'adds a row of cells to hash' do
      # board = Board.new
      #
      # expect(board.cells).to eq({})
      #
      # # Below is set to "A"
      # alpha = board.alpha_array[0]
      # board.make_row(alpha)
      #
      # expect(board.cells).not_to eq({})
      #
      # expect(board.cells.keys).to eq(["A1", "A2", "A3", "A4"])
      #
      # board.cells.each do |coordinate, cell|
      #   expect(cell).to be_instance_of(Cell)
      # end
    end
  end

  context '#validate_coordinate?(coordinate)' do
    it 'validates coordinates' do
      board = Board.new

      expect(board.validate_coordinate?("A1")).to be true
      expect(board.validate_coordinate?("E1")).to be false
    end
  end

  context '#valid_placement?(ship, coordinates)' do
    it 'validates placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
    end
  end

  context '#valid_length?(ship, coordinates)' do
    it 'valid length' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_length?(cruiser, ["A1", "A2", "A3"])).to be true
    end

    it 'invalid length' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_length?(cruiser, ["A2", "A3"])).to be false
    end
  end

  context '#consecutive_coordinates?(coordinates)' do
    it 'consecutive coordinates' do
      board = Board.new

      expect(board.consecutive_coordinates?(["A1", "A2", "A3"])).to be true
      expect(board.consecutive_coordinates?(["A1", "B1", "C1"])).to be true
    end

    it 'inconsecutive coordinates' do
      board = Board.new

      expect(board.consecutive_coordinates?(["A1", "A2", "A4"])).to be false
      expect(board.consecutive_coordinates?(["A1", "D1", "C1"])).to be false
      expect(board.consecutive_coordinates?(["A3", "A2", "A1"])).to be false
    end
  end

  context '#consecutive_numbers?(coordinates)' do
    it 'consecutive numbers' do
      board = Board.new

      expect(board.consecutive_numbers?(["A1", "A2", "A3"])).to be true
      expect(board.consecutive_numbers?(["C2", "C3", "C4"])).to be true
    end

    it 'inconsecutive numbers' do
      board = Board.new

      expect(board.consecutive_numbers?(["A1", "A2", "A4"])).to be false
      expect(board.consecutive_numbers?(["A1", "D1", "C1"])).to be false
      expect(board.consecutive_numbers?(["A3", "A2", "A1"])).to be false
    end
  end

  context '#consecutive_letters?(coordinates)' do
    it 'consecutive letters' do
      board = Board.new

      expect(board.consecutive_letters?(["A1", "B1", "C1"])).to be true
      expect(board.consecutive_letters?(["B2", "C2", "D2"])).to be true
    end

    it 'inconsecutive letters' do
      board = Board.new

      expect(board.consecutive_letters?(["A4", "C4", "B4"])).to be false
      expect(board.consecutive_letters?(["A1", "D1", "C1"])).to be false
      expect(board.consecutive_letters?(["B2", "A2"])).to be false
    end
  end

  # validates cells are on our board
  context '#valid_cells?(coordinates)' do
    it 'valid cells' do
      board = Board.new

      expect(board.valid_cells?(["A2", "A3", "A4"])).to be true
      expect(board.valid_cells?(["B3", "B4", "B5"])).to be false
    end
  end

  context '#place(ship, coordinates)' do
    it 'places ship on cells' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      board.place(cruiser, ["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
    end
  end

  context '#no_ship(coordinates)' do
    it 'confirms there is no ship' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      coordinates = ["A1", "A2", "A3"]

      expect(board.no_ship(coordinates)).to be(true)

      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.no_ship(coordinates)).to be(false)
    end
  end

  context '#render' do
    it 'renders the board' do
      board = Board.new

      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end

  context '#top_row' do
    it 'returns a string of the top row' do
      board = Board.new

      expect(board.top_row).to eq("  1 2 3 4 \n")
    end
  end

  context '#other_rows' do
    it 'returns other_rows string' do
      board = Board.new

      expect(board.other_rows).to eq("A . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
