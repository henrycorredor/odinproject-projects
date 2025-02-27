class User
  attr_reader :name, :id
  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.validate_name(name)
    !name.empty?
  end

  def self.request_name
    valid_name = false
    until valid_name
      print "Input your name:\n"
      player_one_name = gets.chomp
      valid_name = self.validate_name(player_one_name)
      print "Invalid name. Please try again.\n" unless valid_name
    end
    player_one_name
  end

  def attempt_make_move(move)
    places = move.split("")
    column = places[0]
    row = places[1]
    valid_input = %w[a b c].include?(column) && [1, 2, 3].include?(row)
    unless valid_input
      print "Invalid movement."
      print "Please input column (a, b, c) + row (1, 2, 3)"
      print "Ex: right -> b2, c1  /   wrong -> 1a, d5"
      return valid_input
    end
    valid_input
  end
end