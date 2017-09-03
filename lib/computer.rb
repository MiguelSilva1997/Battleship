require './lib/dashboard'
require './lib/ships'
require './lib/validations'
require 'pry'
class Computer
  include Validations
  attr_accessor :ships, :dashboard

  def initialize
    @ships = Ships.new
    @dashboard = Dashboard.new
  end

  def random_position_destroyer
    destroyer_validations.sample
  end

  def random_position_cruiser
    coordinates = cruiser_validations.sample
    if coordinates[0][0] == coordinates[1][0]
      full_coordinates = coordinates.insert(1,[coordinates[0][0] + coordinates[0][1].next])
      check_for_ai_occupied_positions(full_coordinates.flatten)
    else
      full_coordinates = coordinates.insert(1,[coordinates[0][0].next + coordinates[0][1]])
      check_for_ai_occupied_positions(full_coordinates.flatten)
    end
  end

  def check_for_ai_occupied_positions(full_coordinates)
    if full_coordinates.any?{|a| ships.destroyer[:coordinates].include?(a)}
      random_position_cruiser
    else
      full_coordinates.flatten
    end
  end

end
