require './lib/board'
require './lib/ship'

class Game
  attr_reader :human,
              :robot

  def initialize
    @human = { board: Board.new,
               ships: [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)],
               shots_fired: [] }
    @robot = { board: Board.new,
               ships: [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)],
               shots_fired: [] }
  end

  def start
    refresh_screen
    puts menu
    play if play?
  end

  def refresh_screen
    clear_screen
    render_boards
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
    setup
    until player_ships_sunk?(human) || player_ships_sunk?(robot)
      turn
    end
    puts congratulate_winner(winner)
  end

  def setup
    place_robot_ships(robot[:ships])
    puts human_turn_prompt
    puts ship_list
    place_human_ships(human[:ships])
  end

  # change naming later to customize gameplay.
  # human player can choose to place ships randomly.
  def place_robot_ships(ships)
    ships.each do |ship|
      place_robot_ship(ship)
    end
  end

  def place_robot_ship(ship)
    coordinates = get_robot_placement(ship)

    if robot[:board].valid_placement?(ship, coordinates)
      robot[:board].place(ship, coordinates)
    else
      place_robot_ship(ship)
    end
  end

  def get_robot_placement(ship)
    cell_num = random_cell_num
    placement = choose_orientation(ship, cell_num)
  end

  def choose_orientation(ship, cell_num)
    zero_or_one == 0 ? orient_right(ship, cell_num) : orient_down(ship, cell_num)
  end

  def random_cell_num
    num = rand(robot[:board].cells.keys.count)
    robot[:board].cells.keys[num]
  end

  def zero_or_one
    rand(2)
  end

  # refactor to combine orient_right and orient_down later.
  # num and alpha are the only difference in these blocks.
  def orient_right(ship, cell_num)
    ship_array = []
    alpha = alpha(cell_num)
    num = num(cell_num)
    ship.length.times do
      ship_array << alpha + num
      num.next!
    end
    ship_array
  end

  def orient_down(ship, cell_num)
    ship_array = []
    alpha = alpha(cell_num)
    num = num(cell_num)
    ship.length.times do
      ship_array << alpha + num
      alpha.next!
    end
    ship_array
  end

  def alpha(cell_num)
    cell_num.delete("0-9")
  end

  def num(cell_num)
    cell_num.delete("^0-9")
  end

  def place_human_ships(ships)
    ships.each do |ship|
      place_human_ship(ship)
      refresh_screen
    end
  end

  def place_human_ship(ship)
    coordinates = get_human_placement(ship)

    if human[:board].valid_placement?(ship, coordinates)
      human[:board].place(ship, coordinates)
    else
      place_human_ship(ship)
    end
  end

  def get_human_placement(ship)

    puts enter_coordinates(ship)
    gets.chomp.upcase.split(' ')
  end

  # make this dynamic later.
  def human_turn_prompt
    "I have laid out my ships on the grid.\nYou now need to lay out your two ships."
  end

  # make this dynamic later.
  def ship_list
    "The Cruiser is three units long and the Submarine is two units long."
  end

  def enter_coordinates(ship)
    "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
  end

  def turn
    # User board is displayed showing hits, misses, sunken ships, and ships
    # Computer board is displayed showing hits, misses, and sunken ships
    # Computer chooses a random shot. does not fire on the same spot twice

    # add countdown here
    coordinate = robot_choose_coordinate
    human[:board].fire_upon(coordinate)
    refresh_screen
    puts human[:board].cells[coordinate].report('I', 'my', 'your')


    # User can choose a valid coordinate to fire on
    # Entering invalid coordinate prompts user to enter valid coordinate
    coordinate = human_choose_coordinate
    robot[:board].fire_upon(coordinate)
    refresh_screen
    puts human[:board].cells[coordinate].report('you', 'your', 'my')

    # Both robot and player shots are reported as a hit, sink, or miss << done
    # User is informed when they have already fired on a coordinate << done below

    # Board is updated after a turn (refresh screen)
  end

  def robot_choose_coordinate
    robot_shot = random_cell_num

    if robot[:shots_fired].include?(robot_shot)
      robot_choose_coordinate
    end

    robot[:shots_fired] << robot_shot
    robot_shot
  end

  def human_choose_coordinate
    human_shot = gets.chomp.upcase

    if human[:shots_fired].include?(human_shot)
      puts "Please enter a new coordinate:"
      human_choose_coordinate
    elsif robot[:board].validate_coordinate?(human_shot)
      human[:shots_fired] << human_shot
    else
      puts "Please enter a valid coordinate:"
      human_choose_coordinate
    end

    human_shot
  end

  def player_ships_sunk?(player)
    player[:ships].all? { |ship| ship.sunk? }
  end

  def robot_header
    "=============ROBOT BOARD============="
  end

  def human_header
    "=============HUMAN BOARD============="
  end

  def render_boards
    puts robot_header
    puts robot[:board].render
    puts human_header
    puts human[:board].render(true)
  end

  def robot_winner
    "I win. Destroy all humans."
  end

  def human_winner
    "You win. Does not compute."
  end

  def winner
    if player_ships_sunk?(human)
      robot
    elsif player_ships_sunk?(robot)
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
end
