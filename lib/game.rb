class Game
  attr_reader :user_board,
              :robot_board

  def initialize(user_board, robot_board)
    @user_board  = user_board
    @robot_board = robot_board
  end

  def start
    clear_screen
    puts menu
  end

  def clear_screen
    system 'clear'
    puts
  end

  def menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end
end
