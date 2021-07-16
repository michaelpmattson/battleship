class Game
  attr_reader :human_board,
              :robot_board

  def initialize(human_board, robot_board)
    @human_board  = human_board
    @robot_board = robot_board
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

  end

  def random_cell
    num = rand(robot_board.cells.keys.count)
    robot_board.cells.keys[num]
  end

  def random_dir
    # use rand(1) to choose right or down
  end

  # def get_human_placement
  #
  # end
end
