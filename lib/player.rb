require './dashboard'
class Player
 attr_reader :dashboard

  def initialize
    @battleship ={}
    @dashboard = Dashboard.new
  end

end
