require_relative 'board_unit'
require_relative 'player_turn'

class SquareBoard

  attr_reader :last_turn, :moves
  
  def initialize
    @board = Array.new(10) do
      Array.new(10) do
        BoardUnit.new
      end
    end
    @moves = 0
  end

  def column(col_index)
    this_column = []
    row_index = 0
    9.times do
      this_column << @board[row_index][col_index].to_char
      row_index += 1
    end
    this_column
  end

  def rows
    @board
  end

  def update_turn(player, row_index, col_index)
    @last_turn = PlayerTurn.new(self, player, row_index, col_index)
    @last_turn.make_move!
    @moves += 1
  end

  def winner_found?
    if @last_turn
      @last_turn.win?
    else
      false
    end
  end

  def announce_winner
    @last_turn.announce_winner
  end

  def display
    board_print = ""
    @board.each do |row|
      units = []
      row.each do |unit|
        units << unit.to_char
      end
      board_print << "| " + units.join(" ") + " |\n"
    end
    board_print << "  A B C D E F G H I J  "
    return board_print
  end

end
