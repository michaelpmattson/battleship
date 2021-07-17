require './lib/board'
require './lib/ship'

class Game
  attr_reader :human,
              :robot,
              :shots_fired

  def initialize
    @human = { board: Board.new,
               ships: [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)] }
    @robot = { board: Board.new,
               ships: [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)] }
    @shots_fired = []
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
    setup

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
    puts human[:board].render(true)
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
    # Computer chooses a random shot
    # computer_shot = computer_choose_spot
    # require "pry"; binding.pry
    human[:board].fire_upon(computer_choose_coordinate)
    require "pry"; binding.pry
    # User can choose a valid coordinate to fire on
    # Entering invalid coordinate prompts user to enter valid coordinate
    # Both computer and player shots are reported as a hit, sink, or miss
    # User is informed when they have already fired on a coordinate
    # Board is updated after a turn
  end

  def computer_choose_coordinate
    computer_shot = random_cell_num
    # Computer does not fire on the same spot twice
    while shots_fired.include? computer_shot
      computer_shot = random_cell_num
    end
    @shots_fired << computer_shot
    computer_shot
  end
end
