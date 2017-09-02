class Dashboard
  attr_accessor :dashboard
  def initialize
    @dashboard = {"A1" => [false, ""], "A2" => [false, ""], "A3" => [false, ""], "A4" => [false, ""],
    "B1" => [false, ""], "B2" => [false, ""], "B3" => [false, ""], "B4" => [false, ""],
    "C1" => [false, ""], "C2" => [false, ""], "C3" => [false, ""], "C4" => [false, ""],
    "D1" => [false, ""], "D2" => [false, ""], "D3" => [false, ""], "D4" => [false, ""]}
  end

  def board_game
    "    .  1  2  3  4
    A  #{board["A1"][1]}  #{board["A2"][1]}  #{board["A3"][1]}  #{board["A4"][1]}
    B  #{board["B1"][1]}  #{board["B2"][1]}  #{board["B3"][1]}  #{board["B4"][1]}
    C  #{board["C1"][1]}  #{board["C2"][1]}  #{board["C3"][1]}  #{board["C4"][1]}
    D  #{board["D1"][1]}  #{board["D2"][1]}  #{board["D3"][1]}  #{board["D4"][1]}"
  end

end
