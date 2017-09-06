require './lib/messages'
require './lib/computer'
require './lib/player'
require './lib/validations'

class Gameplay
  include Messages
  include Validations

  attr_reader :player, :ai, :time
  def initialize
    @player = Player.new
    @ai = Computer.new
    @time = Time.now
  end

  def input
    gets.chomp.strip
  end

  def display(input)
    puts input
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
    ai.random_position_destroyer
    ai.random_position_cruiser
    player.player_coordinates_destroyer(input)
    display(player_cruiser_ship)
    player.player_coordinates_cruiser(input)
    display(shots)
    shoot(input)
  end


  def shoot(shot = input)
    if !ai.dashboard.board.keys.include?(shot)
      display(wrong_shot_coordinate)
      shoot
    elsif ai.dashboard.board[shot][1] != " "
      display(repeated_coordinate)
      shoot
    elsif ai.dashboard.board[shot][0] == true
      display(hits)
      ai.dashboard.board[shot][1] = "\u{1F4A5}"
      sleep(3)
      display(ai.dashboard.begginer_game)
      check_ai_armada
    else
      display(miss)
      ai.dashboard.board[shot][1] = "\u{1F30A}"
      sleep(3)
      display(ai.dashboard.begginer_game)
      ai_shoot
    end
  end

  def check_ai_armada
    if check_for_ai_destroyer && check_for_ai_cruiser
      display(winner)
      end_game(player)
    elsif check_for_ai_destroyer
      display(ai_destroyer)
      ai_shoot
    elsif check_for_ai_cruiser
      display(ai_cruiser)
      ai_shoot
    else
      ai_shoot
    end
  end

  def check_for_ai_destroyer
    ai.ships.destroyer[:coordinates].all? do |cord|
      ai.dashboard.board[cord][1] == "\u{1F4A5}"
    end
  end

  def check_for_ai_cruiser
    ai.ships.cruiser[:coordinates].all? do |cord|
      ai.dashboard.board[cord][1] == "\u{1F4A5}"
    end
  end

  def ai_shoot
    shot = ai.dashboard.board.keys.sample
    if !player.dashboard.board.keys.include?(shot)
      ai_shoot
    elsif player.dashboard.board[shot][1] != " "
      ai_shoot
    elsif player.dashboard.board[shot][0] == true
      display(ai_hit)
      player.dashboard.board[shot][1] = "\u{1F4A5}"
      sleep(2)
      display(player.dashboard.begginer_game)
      check_player_armada
    else
      display(ai_miss)
      player.dashboard.board[shot][1] = "\u{1F30A}"
      sleep(2)
      display(player.dashboard.begginer_game)
      display(shots)
      shoot
    end
  end

  def check_player_armada
    if check_for_player_destroyer && check_for_player_cruiser
      display(you_lose)
      end_game(ai)
    elsif check_for_player_destroyer
      display(player_destroyer)
      shoot
    elsif check_for_player_cruiser
      display(player_cruiser)
      shoot
    else
      shoot
    end
  end

  def check_for_player_destroyer
    player.ships.destroyer[:coordinates].all? do |cord|
      player.dashboard.board[cord][1] == "\u{1F4A5}"
    end
  end

  def check_for_player_cruiser
    player.ships.cruiser[:coordinates].all? do |cord|
      player.dashboard.board[cord][1] == "\u{1F4A5}"
    end
  end

  def end_game(user)
    shots = user.dashboard.board.values.count{|x| x[1] != " "}
    shots += 1 if user == player
    finish = Time.now
    diff = finish - time
    display(end_game_message(shots, diff.to_i))
  end
end
