INDEX_MAP = {
  "a" => 0,
  "b" => 1,
  "c" => 2
}

WIN_COMBINATIONS = [
  [[0, 0], [0, 1], [0, 2]],
  [[0, 0], [1, 1], [2, 2]],
  [[0, 0], [1, 0], [2, 0]],
  [[0, 1], [1, 1], [2, 1]],
  [[0, 2], [1, 2], [2, 2]],
  [[0, 2], [1, 1], [2, 0]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],
]

class TicTacToe
  # @param users [Array(User, User)]
  def initialize(users)
    @users = users
    @turn = 0
    @movements = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    print "Let's start the game! \n"
    print_board
  end

  def request_move
    print "It's #{@users[@turn].name}'s turn \n"
    game_end = false
    until game_end
      movement = self.attempt_move
      if @movements[movement[0]][movement[1]] === " "
        @movements[movement[0]][movement[1]] = @turn == 0 ? "X" : "O"
        print_board
        the_winner = verify_winner
        if the_winner.nil?
          @turn = @turn == 0 ? 1 : 0
          print "Great! now is #{@users[@turn].name} turn\n"
        else
          print "Good job #{the_winner}! you are de winner!"
          game_end = true
        end
      else
        print "Place taken, try again \n"
      end
    end
  end

  def attempt_move
    valid_input = false
    print "Enter your move:\n"
    until valid_input
      move = gets.chomp
      places = move.split("")
      column = places[0]
      row = places[1]
      valid_input = %w[a b c].include?(column) && ["1", '2', '3'].include?(row)
      if valid_input
        move = [INDEX_MAP[column], row.to_i - 1]
      else
        print "Invalid movement.\n"
        print "Please input column (a, b, c) + row (1, 2, 3)\n"
        print "Ex: right -> b2, c1  /   wrong -> 1a, d5\n"
        print "Try again:\n"
      end
    end
    move
  end

  def verify_winner
    winner = nil
    WIN_COMBINATIONS.each do |line|
      compare = @movements[line[0][0]][line[0][1]]
      next if compare == " "
      all_equal = line.all? { |cell| @movements[cell[0]][cell[1]] == compare }
      if all_equal
        winner = compare
        break
      end
    end
    winner
  end

  def print_board
    puts "\n"
    puts "   1   2   3 "
    puts "a  #{@movements[0][0]} | #{@movements[0][1]} | #{@movements[0][2]} "
    puts "  ---+---+---"
    puts "b  #{@movements[1][0]} | #{@movements[1][1]} | #{@movements[1][2]} "
    puts "  ---+---+---"
    puts "c  #{@movements[2][0]} | #{@movements[2][1]} | #{@movements[2][2]} "
    puts "\n"
  end

  def start
    request_move
  end
end