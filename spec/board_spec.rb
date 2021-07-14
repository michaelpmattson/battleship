require './lib/board'

RSpec.describe Board do
  context '#initialize' do
    it 'exists' do
      board = Board.new

      expect(board).to be_instance_of(Board)
    end

    xit 'has a cells hash with Cell objects as values' do
      board = Board.new

      expect(board.cells).to be_a(Hash)

      cell_values = board.cells.values # an array
      all_cells = cell_values.all? { |value| value.class == Cell } # t or f

      expect(all_cells).to be(true) # confirms all values are Cell objects
    end
  end

  context '#make_cells' do

  end

  context 'alpha_array' do
    it 'makes an array of strings from A to D' do
      board = Board.new
      alpha = board.alpha_array

      expect(alpha).to eq(["A", "B", "C", "D"])
    end
  end
end
