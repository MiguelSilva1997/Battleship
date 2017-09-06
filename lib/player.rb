require './lib/dashboard'
require './lib/ships'
require './lib/messages'
require './lib/validations'

class Player
  include Messages
  include Validations
 attr_reader :dashboard, :ships

  def initialize
    @ships = Ships.new
    @dashboard = Dashboard.new
  end

  def display(output)
    puts output
  end

  def input
    gets.chomp.strip
  end

  def player_coordinates_destroyer(coordinate)
    if !coordinate.include?(' ')
      display(wrong_coordinate)
      player_coordinates_destroyer(input)
    elsif !destroyer_validations.include?(coordinate.split(" ").sort)
      display(wrong_coordinate)
      player_coordinates_destroyer(input)
    else
      ships.destroyer[:coordinates] = coordinate.split(" ").sort
      board_positioning_destroyer
    end
  end

  def player_coordinates_cruiser(coordinate)
    if !coordinate.include?(' ')
      display(wrong_coordinate_cruiser)
      player_coordinates_cruiser(input)
    elsif !cruiser_validations.include?(coordinate.split(" ").sort)
      display(wrong_coordinate_cruiser)
      player_coordinates_cruiser(input)
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
    if full_coordinates.any?{|a| ships.destroyer[:coordinates].include?(a)}
      display(occupied_space)
      player_coordinates_cruiser(input)
    else
      ships.cruiser[:coordinates] = full_coordinates
      board_positioning_cruiser
    end
  end

  def board_positioning_cruiser
    ships.cruiser[:coordinates].each do |position|
      dashboard.board[position][0] = true
    end
  end

  def board_positioning_destroyer
    ships.destroyer[:coordinates].each do |position|
      dashboard.board[position][0] = true
    end
  end

end
