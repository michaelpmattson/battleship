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
      @ship.hit unless @ship.nil? # want to add test for @ship.nil? edge case
    end
  end

  def render(user_ship = false)
    return "S" if user_ship

    if !@ship.nil? && fired_upon? && @ship.sunk?
      "X"
    elsif !@ship.nil? && fired_upon?
      "H"
    elsif fired_upon?
      "M"
    else
      "."
    end
  end
end
