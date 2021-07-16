require './lib/board'

class Game
  attr_reader :human_board,
              :robot_board

  def initialize
    @human_board = Board.new
    @robot_board = Board.new
  end

  def start
    clear_screen
    puts menu
    play if play?
  end

  def clear_screen
    system 'clear'
    puts
  end

  def menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def invalid_answer
    "Invalid choice. Enter p to play. Enter q to quit."
  end

  def not_playing
    "Your loss. See you later alligator!"
  end

  def play?
    input = gets.chomp.downcase
    if input == 'p'
      true
    elsif input == 'q'
      puts not_playing
    else
      puts invalid_answer
      play?
    end
  end

  def play

  end

  def setup
    get_robot_placement
    get_human_placement
  end

  def get_robot_placement
    cell_num = random_cell_num
    zero_or_one == 0 ? orient_right(ship, cell_num) : orient_down(ship, cell_num)
  end

  def random_cell_num
    num = rand(robot_board.cells.keys.count)
    robot_board.cells.keys[num]
  end

  def zero_or_one
    rand(2)
  end

  def orient_right(ship, cell_num)
    ship_array = []
    alpha = cell_num.delete("0-9")
    num = cell_num.delete("^0-9").to_i
    ship.length.times do
      ship_array << alpha + num.to_s
      num += 1
    end
    ship_array
  end

  # def get_human_placement
  #
  # end
end
