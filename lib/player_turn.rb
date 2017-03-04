require "pry"
class PlayerTurn
  attr_reader :board
  attr_reader :player
  attr_reader :row_index
  attr_reader :col_index

  def initialize(board, player, row_index, col_index)
    @board = board
    @player = player
    @row_index = row_index
    @col_index = col_index
  end

  def make_move!
    @board.rows[@row_index][@col_index].player = @player
  end

  def win?
    horizontal_win? || vertical_win? || diagonal_win1? || diagonal_win2?
  end

  def check_occurrences(board_units)
    occurrences = 0
    index = 0
    while (!board_units[index].nil? && occurrences < 4)
      if board_units[index] == @player.char
        occurrences += 1
      else
        occurrences = 0
      end

      index += 1
    end
    occurrences == 4
  end

  def horizontal_win?
    col_index = @col_index
    row_index = @row_index

    col = 0
    units = []
    while (col < 10)
      units << @board.rows[@row_index][col].to_char
      col += 1
    end
    check_occurrences(units)
  end

  def vertical_win?
    col_index = @col_index
    row_index = @row_index

    row = 0
    units = []
    while (row < 10)
      units << @board.rows[row][@col_index].to_char
      row += 1
    end
    check_occurrences(units)
  end

  def diagonal_win1?
    col_index = @col_index
    row_index = @row_index
    units =[]
    while (row_index > 0 && col_index > 0)
      # binding.pry
      row_index -= 1
      col_index -= 1
      units.unshift(@board.rows[row_index][col_index].to_char)
    end
    col_index = @col_index
    row_index = @row_index
    while (row_index < 10 && col_index < 10)
      # binding.pry
      units << @board.rows[row_index][col_index].to_char
      row_index += 1
      col_index += 1
    end
    check_occurrences(units)
  end

  def diagonal_win2?
    col_index = @col_index
    row_index = @row_index
    units =[@board.rows[row_index][col_index].to_char]
    while (row_index < 9 && col_index > 0)
      # binding.pry
      row_index += 1
      col_index -= 1
      units.unshift(@board.rows[row_index][col_index].to_char)
    end
    col_index = @col_index
    row_index = @row_index
    while (row_index > 0 && col_index < 9)
      # binding.pry
      row_index -= 1
      col_index += 1
      units << @board.rows[row_index][col_index].to_char
    end
    check_occurrences(units)
  end

  def announce_winner
    "Player #{@player.char} has won."
  end
end
