# Ruby-TicTacToe-TOP
Tic Tac Toe challenge in Ruby from The Odin Project

# How to Play

Playing is as simple as downloading main.rb and running:

```Bash
ruby main.rb
```

It will being by getting player 1's info then player 2's info. After that player 1 will be asked to make a move. For your moves you have to choose one of the following options:

```text
topl, topm, topr
midl, midm, midr
botl, botm, botr
```

**Example**

```text
player1 make your play: 
topl

X |   |  
----------
  |   |  
----------
  |   |  
player2 make your play: 
midr

X |   |  
----------
  |   | O
----------
  |   |  
  
```

As you can see you can choose top, middle, or bottom, then left, middle, and right. You win by getting 3 in a row vertically, horizontally, or diagonally. Otherwise a Tie will occur if the board is full. Also once a marker has been placed, the another marker can not be placed on that slot.

# Board Object
This object will have a variable data structure that represents the 9-cell
board of tic tack toe.

Perhaps a Hash

```Ruby
class Board
  attr_accessor :board
  def initialize
    @board = {'topl' => ' ', 'topm' => ' ', 'topr' => ' ',
              'midl' => ' ', 'midm' => ' ', 'midr' => ' ',
              'botl' => ' ', 'botm' => ' ', 'botr' => ' '}
  end
end
```
In the hash above it's important to use strings as the hash key in order to pass a players choice easily into the hash location

## Board Methods
The board should be in charge of determining if moves are possible, if there
is a win, or if the board is full.

### Methods
* board_play (x)
  * vetting the move to see it's possible should be done outside of this method
* check\_for\_winner (x)
* fullboard? (x)
* display\_board (x)
  

### Board\_play:

```Ruby
def board_play(player, choice)
  # choice here would be something like "topm" or "midr"
 
  
end
```

### fullboard?
This method must let us know if the board is full. Ideally one would test an array of all the `@board` hash values and see if all are not equal to `' '`. The `fullboard?` method should be checked prior to a `board_play` to ensure it never cuases a problem of overriding values.

### check\_for\_win
This method should check the basic patterns of a TicTacToe win. Such as a straight horizontal, vertical or diagnal win. If these patterns are filled by the same marker of the player that passes in their marker as an argument, then the player wins. This method should be called after a `board_play` utilizing `board_play(player, choice)`.

# Player
This object will represent the actual human players.
The player should have Name (Str) & Marker (Str) Attributes:

```Ruby
class Player
  attr_reader :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end
```

# Gameplay
Gameplay should be a simple method in the script that allows for a loop until
either someone wins or the board is full with no winner. If a player makes an unavailable choice then retry using exception [begin/rescue/retry block](http://ruby.bastardsbook.com/chapters/exception-handling/)

## Gameplay Details
The things to watch for is that the players should take turns,
The players respective markers should be used, and after every move, the board should check to see if the game has been won.

If a player wins then the code will `abort("message of winning")` you can [learn about abort here](https://www.honeybadger.io/blog/how-to-exit-a-ruby-program/)

