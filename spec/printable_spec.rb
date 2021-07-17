require './lib/printable'
require './lib/ship'

RSpec.describe Printable do 
  include Printable

  context 'headers' do
    it 'game_title' do
      expect(game_title).to eq("******************\n**  BATTLESHIP  **\n******************")
    end

    it 'robot_header' do 
      expect(robot_header).to eq("===ROBOT BOARD===")
    end
  
    it 'human_header' do
      expect(human_header).to eq("===HUMAN BOARD===")
    end
  end

  context 'main menu' do
    it 'menu' do
      expect(menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end

    it 'invalid_answer' do
      expect(invalid_answer).to eq("Invalid choice. Enter p to play. Enter q to quit.")
    end

    it 'not_playing' do 
      expect(not_playing).to eq("Your loss. See you later alligator!")
    end
  end

  context 'turn' do
    it 'human_turn_prompt' do  
      expect(human_turn_prompt).to eq("I have laid out my ships on the grid.\nYou now need to lay out your two ships.")
    end

    it 'ship_list' do 
      expect(ship_list).to eq("The Cruiser is three units long and the Submarine is two units long.")
    end

    it 'enter_coordinates(ship)' do 
      ship = Ship.new("Tugboat", 3)

      expect(enter_coordinates(ship)).to eq("Enter the squares for the #{ship.name} (#{ship.length} spaces):")
    end

    it 'new_coordinate_prompt' do
      expect(new_coordinate_prompt).to eq("Please enter a new coordinate:")
    end

    it 'valid_coordinate_prompt' do   
      expect(valid_coordinate_prompt).to eq("Please enter a valid coordinate:")
    end

    it 'human_choice_prompt' do
      expect(human_choice_prompt).to eq("Your turn. Please enter coordinate:")
    end
  end

  context 'end game' do 
    it 'robot_winner' do
      expect(robot_winner).to eq("I win. Destroy all humans.")
    end

    it 'human_winner' do
      expect(human_winner).to eq("You win. Does not compute.")
    end
  end
end