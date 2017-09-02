require './lib/messages'
require './lib/computer'
require './lib/player'

class Gameplay
  include Messages

  attr_reader :player, :ai
  def initialize
    @player = Player.new
    @ai = Computer.new
  end

  def display(output)
    puts output
  end

  def run_game
    display(welcome)
    answer = gets.chomp.downcase
    if answer == "i" || answer == "instructions"
      display(instructions)
      run_game
    elsif answer == "p" || answer == "play"
      play_game
    elsif answer == "q" || answer == "quit"
      puts "Bye"
    else
      puts "Stick to the rules soldier!"
      run_game
    end
  end

  def play_game
    display(player_ship_placement)
    ai.ships.destroyer[:coordinates] = ai.random_position.sample(2)
    ai.ships.destroyer[:coordinates].each do |position|
      ai.dashboard.board[position][0] = true
    end
    shoot
  end

  def shoot
    shot = gets
    binding.pry
    if !ai.dashboard.board.keys.include?(shot)
      display("Wrong coordinate")
    elsif ai.dashboard.board[shot][0] == true
      ai.dashboard.board[shot][1] = "H"
      display(ai.dashboard.begginer_game)
      shoot
    else
      ai.dashboard.board[shot][1] = "M"
      display(ai.dashboard.begginer_game)
    end
    shoot
  end
end
