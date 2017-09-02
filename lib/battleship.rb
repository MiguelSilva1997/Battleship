require "./lib/messages"
require "./lib/gameplay"
include Messages

game = Gameplay.new.run_game
