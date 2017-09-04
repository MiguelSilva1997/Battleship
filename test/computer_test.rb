require './test/test_helper'
require 'minitest/autorun'
require './lib/computer'


class ComputerTest < Minitest::Test
  def validations
    [["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
     ["B1", "B2"], ["B2", "B3"] ,["B3", "B4"],
     ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
     ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
     ["A1", "B1"], ["B1", "C1"], ["C1", "D1"],
     ["A2", "B2"], ["B2", "C2"] ,["C2", "D2"],
     ["A3", "B3"], ["B3", "C3"], ["C3", "D3"],
     ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
   end

   def cruiser_validations
     [["A1", "A3"], ["A2", "A4"],
      ["B1", "B3"], ["B2", "B4"],
      ["C1", "C3"], ["C2", "C4"],
      ["D1", "D3"], ["D2", "D4"],
      ["A1", "C1"], ["B1", "D1"],
      ["A2", "C2"], ["B2", "D2"],
      ["A3", "C3"], ["B3", "D3"],
      ["A4", "C4"], ["B4", "D4"],]
   end

  def test_if_class_exist
    assert_instance_of Computer, Computer.new
  end

  def test_for_destroyer_random_validations
    computer = Computer.new
    coordinates = computer.random_position_destroyer

    assert validations.include?(coordinates)
  end

  def test_for_cruiser_random_validations
    computer = Computer.new
    computer.ships.destroyer[:coordinates] = ["A1", "A2"]
    coordinates = computer.random_position_cruiser

    assert_equal true, cruiser_validations.include?([coordinates[0], coordinates[2]])
  end

   def test_for_ai_occupied_positions
     computer = Computer.new
     computer.ships.destroyer[:coordinates] = ["A1", "A2"]
     computer.check_for_ai_occupied_positions(["A1", "A2", "A3"])

     assert computer.random_position_cruiser
   end
end
