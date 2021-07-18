require './lib/player'
require './lib/printable'

class Human < Player
  include Printable

  def place_ships(ships)
    ships.each do |ship|
      coordinates = get_coordinates(ship)
      place_ship(ship, coordinates)
      refresh_screen
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