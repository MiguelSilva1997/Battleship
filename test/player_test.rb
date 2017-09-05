require './test/test_helper'
require 'minitest/autorun'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_if_class_exist
    assert_instance_of Player, Player.new
  end

  def test_for_right_coordinate
    player = Player.new
    input = "A1 A2"

    assert_equal ["A1","A2"],  player.player_coordinates_destroyer("A1 A2")
  end

  def test_for_player_coordinates_cruiser_method
     player = Player.new
     player.ships.destroyer[:coordinates] = ["A1", "A2"]
     input = "A3 C3"

     assert_equal ["A3", "B3", "C3"], player.player_coordinates_cruiser(input)
  end

  def test_cruiser_coordinates_method
    player = Player.new
    player.ships.destroyer[:coordinates] = ["A1", "A2"]
    input = "A3 C3"

    assert_equal ["A3", "B3", "C3"], player.player_coordinates_cruiser(input)
    assert_equal ["B1", "B2", "B3"], player.player_coordinates_cruiser("B1 B3")
  end

  def test_check_for_occupied_positions_methods
    player = Player.new
    player.ships.destroyer[:coordinates] = ["A1", "A2"]

    assert_equal ["A3", "B3", "C3"], player.check_for_occupied_positions(["A3", "B3", "C3"])
  end

  def test_board_positioning_cruiser_method
    player = Player.new
    player.ships.destroyer[:coordinates] = ["A1", "A2"]
    player.check_for_occupied_positions(["A3", "B3", "C3"])

    assert_equal ["A3", "B3", "C3"],  player.board_positioning_cruiser
  end

  def test_if_board_positioning_destroyer_method
    player = Player.new
    player.ships.destroyer[:coordinates] = ["A1", "A2"]

    assert ["A1", "A2"], player.board_positioning_destroyer
  end

end
