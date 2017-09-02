require 'minitest/autorun'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_if_class_exist
    assert_instance_of Computer, Computer.new
  end

end
