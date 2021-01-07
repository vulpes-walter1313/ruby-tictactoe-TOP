# spec/Board_spec.rb
require './lib/Board'

describe Board do
  context "#fullboard?" do
    it "returns false on an empty board" do
      board = Board.new
      expect(board.fullboard?).to be_falsey
    end

    it "returns true on an full board" do
      my_board = Board.new
      # populate all slots with values
      my_board.board.each_key do | key |
        my_board.board[key] = 'X'
      end
      expect(my_board.fullboard?).to be_truthy
    end
  end
end