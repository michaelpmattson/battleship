require './lib/board'

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
end
