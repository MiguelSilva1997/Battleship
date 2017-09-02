require './messages'
require './computer'

class Gameplay
  include Messages

  # attr_reader :output, :input
  #
  # def initialize
  #   @output =
  #   @input = input
  # end

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
    ai = Computer.new
    ai.random_position

  end
end
