require './lib/validations'
class Dashboard
  include Validations
  attr_accessor :board
  def initialize
    @board = board_key
  end

  def begginer_game
    "    ++++++++++++++++++
    .  1 2 3 4
    A  #{board["A1"][1]} #{board["A2"][1]} #{board["A3"][1]} #{board["A4"][1]}
    B  #{board["B1"][1]} #{board["B2"][1]} #{board["B3"][1]} #{board["B4"][1]}
    C  #{board["C1"][1]} #{board["C2"][1]} #{board["C3"][1]} #{board["C4"][1]}
    D  #{board["D1"][1]} #{board["D2"][1]} #{board["D3"][1]} #{board["D4"][1]}
    ++++++++++++++++++"
  end

end
