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
    @time = time
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
      @time = Time.now
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
    ai.ships.destroyer[:coordinates] = ai.random_position_destroyer
    ai.ships.cruiser[:coordinates] = ai.random_position_cruiser
    board_positioning_destroyer(ai)
    board_positioning_cruiser(ai)
    player_coordinates_destroyer
    shoot
  end


  def player_coordinates_destroyer
    coordinate = gets.chomp.strip
    if !coordinate.include?(' ')
      display(wrong_coordinate)
      player_coordinates_destroyer
    elsif !destroyer_validations.include?(coordinate.split(" ").sort)
      display(wrong_coordinate)
      player_coordinates_destroyer
    else
      player.ships.destroyer[:coordinates] = coordinate.split(" ").sort
      board_positioning_destroyer(player)
    end
    display(player_cruiser_ship)
    player_coordinates_cruiser
  end

  def player_coordinates_cruiser
    coordinate = gets.chomp.strip
    if !coordinate.include?(' ')
      display(wrong_coordinate_cruiser)
      player_coordinates_cruiser
    elsif !cruiser_validations = coordinate.split(" ").sort
      display(wrong_coordinate_cruiser)
      player_coordinates_cruiser
    else
      cruiser_coordinates(coordinate.split(" ").sort)
    end
  end

  def cruiser_coordinates(coordinates)
    if coordinates[0][0] == coordinates[1][0]
      full_coordinates = coordinates.insert(1,[coordinates[0][0] + coordinates[0][1].next])
      check_for_occupied_positions(full_coordinates.flatten)
    else
      full_coordinates = coordinates.insert(1,[coordinates[0][0].next + coordinates[0][1]])
      check_for_occupied_positions(full_coordinates.flatten)
    end
  end

  def check_for_occupied_positions(full_coordinates)
    if full_coordinates.any?{|a| player.ships.destroyer[:coordinates].include?(a)}
      display(occupied_space)
      player_coordinates_cruiser
    else
      player.ships.cruiser[:coordinates] = full_coordinates
      board_positioning_cruiser(player)
    end
  end

  def board_positioning_cruiser(user)
    user.ships.cruiser[:coordinates].each do |position|
      user.dashboard.board[position][0] = true
    end
  end

  def board_positioning_destroyer(player)
    player.ships.destroyer[:coordinates].each do |position|
      player.dashboard.board[position][0] = true
    end
  end

  def shoot
    display(shot)
    shot = gets.chomp
    if !ai.dashboard.board.keys.include?(shot)
      display(wrong_shot_coordinate)
      shoot
    elsif ai.dashboard.board[shot][1] != " "
      display(repeated_coordinate)
      shoot
    elsif ai.dashboard.board[shot][0] == true
      display(hits)
      ai.dashboard.board[shot][1] = "H"
      sleep(3)
      display(ai.dashboard.begginer_game)
      check_ai_armada
    else
      display(miss)
      ai.dashboard.board[shot][1] = "M"
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
      ai.dashboard.board[cord][1] == "H"
    end
  end

  def check_for_ai_cruiser
    ai.ships.cruiser[:coordinates].all? do |cord|
      ai.dashboard.board[cord][1] == "H"
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
      player.dashboard.board[shot][1] = "H"
      sleep(3)
      display(player.dashboard.begginer_game)
      check_player_armada
    else
      display(ai_miss)
      player.dashboard.board[shot][1] = "M"
      sleep(3)
      display(player.dashboard.begginer_game)
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
      player.dashboard.board[cord][1] == "H"
    end
  end

  def check_for_player_cruiser
    player.ships.cruiser[:coordinates].all? do |cord|
      player.dashboard.board[cord][1] == "H"
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
