require_relative 'lib/Board'
require_relative 'lib/Player'

board = Board.new

puts "Let's start with getting player one's info"
puts "\nWhat is you name? "
name1 = gets.chomp
puts "\nWhat do you want your marker to be? "
marker1 = gets.chomp[0]
player1 = Player.new(name1, marker1)

puts "Let's start with getting player two's info"
puts "\nWhat is you name? "
name2 = gets.chomp
puts "\nWhat do you want your marker to be? "
marker2 = gets.chomp[0]
player2 = Player.new(name2, marker2)

players = [player1, player2]
counter = 0
until board.fullboard?
  turn = counter % 2
  puts "#{players[turn].name} make your play: "
  choice = gets.chomp
  if board.board.keys.include?(choice) && board.board[choice] == ' '
    board.board_play(players[turn], choice)
    counter += 1
  else
    redo
  end
end
abort('Board Full: Tie')
