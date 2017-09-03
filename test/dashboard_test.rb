require './test/test_helper'
require 'minitest/autorun'
require './lib/dashboard'

class DashboardTest < Minitest::Test

  def board
    {"A1" => [false, " "], "A2" => [false, " "], "A3" => [false, " "], "A4" => [false, " "],
   "B1" => [false, " "], "B2" => [false, " "], "B3" => [false, " "], "B4" => [false, " "],
   "C1" => [false, " "], "C2" => [false, " "], "C3" => [false, " "], "C4" => [false, " "],
   "D1" => [false, " "], "D2" => [false, " "], "D3" => [false, " "], "D4" => [false, " "]}
  end

  def puts_board
    "    ++++++++++++++++++
    .  1 2 3 4
    A  #{board["A1"][1]} #{board["A2"][1]} #{board["A3"][1]} #{board["A4"][1]}
    B  #{board["B1"][1]} #{board["B2"][1]} #{board["B3"][1]} #{board["B4"][1]}
    C  #{board["C1"][1]} #{board["C2"][1]} #{board["C3"][1]} #{board["C4"][1]}
    D  #{board["D1"][1]} #{board["D2"][1]} #{board["D3"][1]} #{board["D4"][1]}
    ++++++++++++++++++"
  end

  def test_instance_of_the_class
     assert_instance_of Dashboard, Dashboard.new
  end

  def test_key_in_the_board
     dashboard = Dashboard.new

     assert dashboard.board["A1"]
     refute dashboard.board["Z1"]
  end

  def test_content_of_key
     dashboard = Dashboard.new

     assert_equal [false, " "], dashboard.board["A1"]
     assert_equal [false, " "], dashboard.board["B1"]
     assert_equal [false, " "], dashboard.board["C1"]
  end

  def test_if_beginner_board_method
     dashboard = Dashboard.new

     assert_equal puts_board, dashboard.begginer_game
  end
end
