require './lib/printable'
require './lib/human'
require './lib/robot'

class Game
  include Printable

  attr_reader :human,
              :robot

  def initialize
    @human = Human.new
    @robot = Robot.new
  end

  # Start and setup -------------------
  def start
    refresh_screen
    puts menu
    play if play?
  end

  def refresh_screen
    clear_screen
    render_screen
  end

  def clear_screen
    system 'clear'
    puts
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
    setup
    turn until winner?
    puts congratulate_winner(winner)
  end

  def setup
    robot.place_ships(robot.ships)
    puts human_turn_prompt
    puts ship_list
    human.place_ships(human.ships)
  end

  # Turn ---------------------------
  def turn
    robot_countdown
    coordinate = robot.choose_coordinate
    human.board.fire_upon(coordinate)
    refresh_screen
    puts human.board.cells[coordinate].report('I', 'my', 'your')

    return if winner?

    puts human_choice_prompt
    coordinate = human.choose_coordinate(robot.board)
    robot.board.fire_upon(coordinate)
    refresh_screen
    puts robot.board.cells[coordinate].report('you', 'your', 'my')
  end

  # Display things --------------------
  def render_screen
    puts game_title
    puts
    puts robot_header
    puts robot.board.render
    puts
    puts human_header
    puts human.board.render(true)
    puts
  end

  def robot_countdown
    sleep 1.8
    puts status = "Calculating trajectory"
    3.times do
      refresh_screen
      puts status += "."
      sleep 1.2
    end
  end

  # End game ------------------------
  def winner
    if human.ships_sunk?
      robot
    elsif robot.ships_sunk?
      human
    end
  end

  def congratulate_winner(winner)
    if winner == human
      human_winner
    elsif winner == robot
      robot_winner
    end
  end

  def winner?
    human.ships_sunk? || robot.ships_sunk?
  end
end
