require_relative 'lib/tic_tac_toe_game'
require_relative 'lib/user'

print "------ Player 1 ------\n"

player_one_name = User.request_name
player_one = User.new(player_one_name, 01)

print "Welcome #{player_one.name}!\n"
print "------ Player 2 ------\n"

player_two_name = User.request_name
player_two = User.new(player_two_name, 01)
print "Welcome #{player_two.name}!\n"

print "#{player_one.name} vs. #{player_two.name}\n"

game = TicTacToe.new([player_one, player_two])
game.start