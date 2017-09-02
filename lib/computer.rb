require './dashboard'
require './ships'
require './validations'
require 'pry'
class Computer
  include Validations
  attr_accessor :ships, :dashboard

  def initialize
    @ships = Ships.new
    @dashboard = Dashboard.new
  end

  def random_position
    destroyer_validations.sample
  end

end
