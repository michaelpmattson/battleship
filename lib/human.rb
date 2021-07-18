require './lib/player'
require './lib/printable'

class Human < Player
  include Printable

  def place_ships(ships)
    ships.each do |ship|
      place_ship(ship)
      # refresh_screen <---- can't do this anymore now that this is in Human
    end
  end

  def place_ship(ship)
    coordinates = get_coordinates(ship) # remove and make a get coordinates method in robot class

    if board.valid_placement?(ship, coordinates) # rest is same
      board.place(ship, coordinates)
    else
      puts valid_coordinates_prompt
      place_ship(ship)
    end
  end

  def get_coordinates(ship)
    puts enter_coordinates(ship)
    gets.chomp.upcase.split(' ')
  end

  def choose_coordinate(board)
    human_shot = gets.chomp.upcase

    if shots_fired.include?(human_shot)
      puts new_coordinate_prompt
      return choose_coordinate(board)
    elsif board.validate_coordinate?(human_shot)
      shots_fired << human_shot
      human_shot
    else
      puts valid_coordinate_prompt
      return choose_coordinate(board)
    end
  end
end
