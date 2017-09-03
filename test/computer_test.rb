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

  def test_if_class_exist
    assert_instance_of Computer, Computer.new
  end

  def test_for_random_validations
    computer = Computer.new

    assert validations.include?(computer.random_position)
  end

end
