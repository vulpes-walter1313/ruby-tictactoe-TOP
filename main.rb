class Board
  attr_accessor :board
  def initialize
    @board = {'topl' => ' ', 'topm' => ' ', 'topr' => ' ',
              'midl' => ' ', 'midm' => ' ', 'midr' => ' ',
              'botl' => ' ', 'botm' => ' ', 'botr' => ' '}
  end

  def display_board
    puts "\n"
    puts "#{board['topl']} | #{board['topm']} | #{board['topr']}"
    puts "-" * ("#{board['midl']} | #{board['midm']} | #{board['midr']}".length + 1)
    puts "#{board['midl']} | #{board['midm']} | #{board['midr']}"
    puts "-" * ("#{board['midl']} | #{board['midm']} | #{board['midr']}".length + 1)
    puts "#{board['botl']} | #{board['botm']} | #{board['botr']}"
  end

  def fullboard?
    full_flag = false
    if board.values.all? { |val| val != ' '}
      full_flag = true
    end
    full_flag
  end

  def check_for_win(name, marker)
    left_vertical = [board['topl'], board['midl'], board['botl']]
    mid_vertical = [board['topm'], board['midm'], board['botm']]
    right_vertical = [board['topr'], board['midr'], board['botr']]
    top_horizontal = [board['topl'], board['topm'], board['topr']]
    mid_horizontal = [board['midl'], board['midm'], board['midr']]
    bottom_horizontal = [board['botl'], board['botm'], board['botr']]
    ltr_updown_diagnal = [board['topl'], board['midm'], board['botr']]
    rtl_updown_diagnal = [board['topr'], board['midm'], board['botl']]
    win_combinations = [left_vertical, mid_vertical, right_vertical, top_horizontal, mid_horizontal, bottom_horizontal,
                        ltr_updown_diagnal, rtl_updown_diagnal]

    win = nil
    # Checks to see i\f any winning combination from the last play results in a win
    win_combinations.each do |comb|
      if comb.all? { |val| val == marker}
        win = true
      end
    end
    # If there is a win, it will be stated and the game exits
    if win
      puts "#{name} wins the game!!"
      abort("Come again!")
    else
      puts "Let's keep it going..."
    end
  end

  def board_play(player, choice)
    # choice here would be something like "topm" or "midr"
    board[choice] = player.marker
    display_board
    check_for_win(player.name, player.marker)
  end
end

class Player
  attr_reader :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

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
until board.fullboard? do
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
abort("Board Full: Tie")


