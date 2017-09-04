module Validations

  def keys
    letters = ("A".."Z").to_a.shift(4)
    number = ("1".."26").to_a.shift(4)
    letters.map {|letter| number.map {|num| letter + num}}.flatten
  end

  def vertical
    keys.map do |key|
      [] << key << key[0].next + key[1] unless key[0] == "D"
    end.compact
  end

  def horizontal
    keys.map do |key|
      [] << key << key[0] + key[1].next unless key[1] == "4"
    end.compact
  end

  def destroyer_validations
    vertical.compact.concat(horizontal.compact)
  end

  def vertical_cruiser
    keys.map do |key|
      [] << key << key[0].next.next + key[1] unless key[0] == "C" || key[0] == "D"
    end
  end

  def horizontal_cruiser
    keys.map do |key|
      [] << key << key[0] + key[1].next.next unless key[1] == "3" || key[1] == "4"
    end
  end

  def cruiser_validations
    vertical_cruiser.compact.concat(horizontal_cruiser.compact)
  end

  def board_key
    positions = {}
    keys.each {|key| positions[key] = [false, " "]}
    positions
  end
end
