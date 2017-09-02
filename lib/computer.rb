require './dashboard'
class Computer
  attr_accessor :ships, :dashboard

  def initialize
    @ships = Ships.new
    @dashboard = Dashboard.new
  end

  def random_position
    board.
    ships.destroyer[]
  end

end
