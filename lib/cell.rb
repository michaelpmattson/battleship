class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?  
  end

  def place_ship(ship)
    @ship = ship if empty?
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    unless fired_upon?
      @fired_upon = true
      @ship.hit 
    end
  end
end