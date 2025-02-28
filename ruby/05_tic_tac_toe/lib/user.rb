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
end