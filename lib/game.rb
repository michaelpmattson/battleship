require './lib/board'
require './lib/ship'
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


  # Player methods ----------------------

  # def place_robot_ship(ship)
  #   coordinates = get_robot_placement(ship) # remove and make a get coordinates method in robot class

  #   if robot[:board].valid_placement?(ship, coordinates) # rest is same
  #     robot[:board].place(ship, coordinates)
  #   else
  #     place_robot_ship(ship)
  #   end
  # end

  # def place_human_ship(ship)
  #   coordinates = get_human_placement(ship) # remove and make a get coordinates method in human class

  #   if human[:board].valid_placement?(ship, coordinates)
  #     human[:board].place(ship, coordinates)
  #   else
  #     place_human_ship(ship)
  #   end
  # end


  # Human player methods ----------------------

  # def place_human_ships(ships)
  #   ships.each do |ship|
  #     place_human_ship(ship)
  #     refresh_screen
  #   end
  # end


  # def human_input # unneeded?
  #   gets.chomp.upcase
  # end

  # def get_human_placement(ship)
  #   puts enter_coordinates(ship)
  #   human_input.split(' ')
  # end

  # def human_choose_coordinate
  #   human_shot = human_input

  #   if human[:shots_fired].include?(human_shot)
  #     puts new_coordinate_prompt
  #     return human_choose_coordinate
  #   elsif robot[:board].validate_coordinate?(human_shot)
  #     human[:shots_fired] << human_shot
  #     human_shot
  #   else
  #     puts valid_coordinate_prompt
  #     return human_choose_coordinate
  #   end
  # end



  # Robot player methods ----------------------

  # change naming later to customize gameplay.
  # human player can choose to place ships randomly.
  # def place_robot_ships(ships)
  #   ships.each do |ship|
  #     place_robot_ship(ship)
  #   end
  # end

  # def get_robot_placement(ship)
  #   cell_num = random_cell_num
  #   placement = choose_orientation(ship, cell_num)
  # end

  # def random_cell_num
  #   num = rand(robot[:board].cells.keys.count)
  #   robot[:board].cells.keys[num]
  # end

  # def zero_or_one
  #   rand(2)
  # end

  # def choose_orientation(ship, cell_num)
  #   zero_or_one == 0 ? orient_right(ship, cell_num) : orient_down(ship, cell_num)
  # end

  # # refactor to combine orient_right and orient_down later.
  # # num and alpha are the only difference in these blocks.
  # def orient_right(ship, cell_num)
  #   ship_array = []
  #   alpha = alpha(cell_num)
  #   num = num(cell_num)
  #   ship.length.times do
  #     ship_array << alpha + num
  #     num.next!
  #   end
  #   ship_array
  # end

  # def orient_down(ship, cell_num)
  #   ship_array = []
  #   alpha = alpha(cell_num)
  #   num = num(cell_num)
  #   ship.length.times do
  #     ship_array << alpha + num
  #     alpha.next!
  #   end
  #   ship_array
  # end

  # def alpha(cell_num)
  #   cell_num.delete("0-9")
  # end

  # def num(cell_num)
  #   cell_num.delete("^0-9")
  # end

  # def robot_choose_coordinate
  #   robot_shot = random_cell_num

  #   if robot[:shots_fired].include?(robot_shot)
  #     return robot_choose_coordinate
  #   end

  #   robot[:shots_fired] << robot_shot
  #   robot_shot
  # end




  # References the players ---------------------------




  # def player_ships_sunk?(player)
  #   player.ships.all? { |ship| ship.sunk? }
  # end








  # The rest of our game class ---------------------------
  # Start and setup
  def start
    refresh_screen
    puts menu
    play if play?
  end

  # possible module
  def refresh_screen
    clear_screen
    render_screen
  end

  #possible module (displayable)
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
    until winner? # make one line
      turn
    end
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
    # User board is displayed showing hits, misses, sunken ships, and ships
    # Computer board is displayed showing hits, misses, and sunken ships
    # Computer chooses a random shot. does not fire on the same spot twice

    robot_countdown
    coordinate = robot.choose_coordinate
    human.board.fire_upon(coordinate)
    refresh_screen
    puts human.board.cells[coordinate].report('I', 'my', 'your')

    return if winner?
    # User can choose a valid coordinate to fire on
    # Entering invalid coordinate prompts user to enter valid coordinate
    puts human_choice_prompt
    coordinate = human.choose_coordinate(robot.board)
    robot.board.fire_upon(coordinate)
    refresh_screen
    puts robot.board.cells[coordinate].report('you', 'your', 'my')

    # Both robot and player shots are reported as a hit, sink, or miss << done
    # User is informed when they have already fired on a coordinate << done below

    # Board is updated after a turn (refresh screen)
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
