require './test/dummy_class'

class MessagesTest < Minitest::Test
  def test_for_welcome_message
    dummy = Dummy.new

    assert dummy.welcome
  end

  def test_for_instructions_message
    dummy = Dummy.new

    assert dummy.instructions
  end

  def test_for_player_ship_placement_message
    dummy = Dummy.new

    assert dummy.player_ship_placement
  end

  def test_for_wrong_coordinate_message
    dummy = Dummy.new

    assert dummy.wrong_coordinate
  end

  def test_for_player_cruiser_ship_message
    dummy = Dummy.new

    assert dummy.player_cruiser_ship
  end

  def test_for_wrong_coordinate_cruiser_message
    dummy = Dummy.new

    assert dummy.wrong_coordinate_cruiser
  end

  def test_for_occupied_space_message
    dummy = Dummy.new

    assert dummy.occupied_space
  end

  def test_for_wrong_shot_coordinate_message
    dummy = Dummy.new

    assert dummy.wrong_shot_coordinate
  end

  def test_for_repeated_coordinate_message
    dummy = Dummy.new

    assert dummy.repeated_coordinate
  end

  def test_for_shots_message
    dummy = Dummy.new

    assert dummy.shots
  end

  def test_for_miss_message
    dummy = Dummy.new

    assert dummy.miss
  end

  def test_for_hits_message
    dummy = Dummy.new

    assert dummy.hits
  end

  def test_for_ai_miss_message
    dummy = Dummy.new

    assert dummy.ai_miss
  end

  def test_for_ai_hit_message
    dummy = Dummy.new

    assert dummy.ai_hit
  end

  def test_for_ai_destroyer_message
    dummy = Dummy.new

    assert dummy.ai_destroyer
  end

  def test_for_ai_cruiser_message
    dummy = Dummy.new

    assert dummy.ai_cruiser
  end

  def test_for_winner_message
    dummy = Dummy.new

    assert dummy.winner
  end

  def test_for_you_lose_message
    dummy = Dummy.new

    assert dummy.you_lose
  end

  def test_for_player_cruiser_message
    dummy = Dummy.new

    assert dummy.player_cruiser
  end

  def test_for_player_destroyer_message
    dummy = Dummy.new

    assert dummy.player_destroyer
  end

  def test_for_end_game_message_message
    dummy = Dummy.new

    assert dummy.end_game_message(12, 12)
  end
end
