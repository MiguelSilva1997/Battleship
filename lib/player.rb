require './lib/dashboard'
require './lib/ships'

class Player
 attr_reader :dashboard, :ships

  def initialize
    @ships = Ships.new
    @dashboard = Dashboard.new
  end

end
