module Printable
  # headers
  def game_title
    "******************\n" +
    "**  BATTLESHIP  **\n" +
    "******************"
  end

  def robot_header
    "===ROBOT BOARD==="
  end

  def human_header
    "===HUMAN BOARD==="
  end

  # main menu
  def menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def invalid_answer
    "Invalid choice. Enter p to play. Enter q to quit."
  end

  def not_playing
    "Your loss. See you later alligator!"
  end

  # turn
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

  def new_coordinate_prompt
    "Please enter a new coordinate:"
  end

  def valid_coordinate_prompt
    "Please enter a valid coordinate:"
  end

  def human_choice_prompt
    "Your turn. Please enter coordinate:"
  end

  # end game
  def robot_winner
    "I win. Destroy all humans."
  end

  def human_winner
    "You win. Does not compute."
  end
end