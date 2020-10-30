class Board
  attr_accessor :board
  def initialize
    @board = {'topl' => ' ', 'topm' => ' ', 'topr' => ' ',
              'midl' => ' ', 'midm' => ' ', 'midr' => ' ',
              'botl' => ' ', 'botm' => ' ', 'botr' => ' '}
  end

  def display_board
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


