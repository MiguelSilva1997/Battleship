require "./messages"
require "./gameplay"
include Messages

game = Gameplay.new.run_game
