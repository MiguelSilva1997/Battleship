module Messages

  def welcome
    "\nWelcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    "\n\s\s\s\sBattleship is a guessing game for two players. It is played on ruled grids
    (paper or board) on which the players' fleets of ships (including
    battleships) are marked. The locations of the fleet are
    concealed from the other player. Players alternate turns calling
    'shots' at the other player's ships, and the objective of the game
    is to destroy the opposing player's fleet."
  end

  def player_ship_placement
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.
    Enter the squares for the two-unit ship:"
  end

  def wrong_coordinate
    "Wrong coordinate! Ex: 'A1 A2'"
  end

  def player_cruiser_ship
    "Enter the squares for the three-unit ship:"
  end

  def wrong_coordinate_cruiser
    "wrong_coordinate! Ex: 'A1 A3'"
  end

  def occupied_space
    "Waters are occupied! Try another coordinate."
  end

  def wrong_shot_coordinate
    "Stay in the grid soldier!"
  end

  def repeated_coordinate
    "Wake Up! There is nothing there."
  end

  def shot
    "Take your best shot soldier."
  end

  def miss
    "You missed your shot soldier"
  end

  def hits
    "I expected nothing else than success"
  end

  def ai_miss
    "They missed their shot. Great positioning!"
  end

  def ai_hit
    "We are sinking!"
  end

  def ai_destroyer
    "We sank their destroyer!"
  end

  def ai_cruiser
    "We sank their cruiser!"
  end

  def winner
    "You manage to destroy all the enemy fleet! Congratulations GENERAL!"
  end

  def you_lose
    "We have lost all of our ships!"
  end

  def player_cruiser
    "We lost our cruiser!"
  end

  def player_destroyer
    "We lost our destroyer!"
  end

  def end_game_message(shots, time)
    "The battle took #{time} seconds and #{shots} shots for the victory."
  end
end
