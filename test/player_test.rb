require './test/test_helper'
require 'minitest/autorun'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_if_class_exist
    assert_instance_of Player, Player.new
  end

end
