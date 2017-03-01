# require_relative 'board_space'
# require_relative 'game_turn'

class Board
  def initialize
    @board = Array.new(10) do (Array.new(10, " ")) end
    @last_row = 0
    @last_column = 0
    @last_player = ""
  end
  #           colums
  # | 0 1 2 3 4 5 6 7 8 9 | 0
  # | 0 1 2 3 4 5 6 7 8 9 | 1
  # | 0 1 2 3 4 5 6 7 8 9 | 2
  # | 0 1 2 3 4 5 6 7 8 9 | 3
  # | 0 1 2 3 4 5 6 7 8 9 | 4
  # | 0 1 2 3 4 5 6 7 8 9 | 5   rows
  # | 0 1 2 3 4 5 6 7 8 9 | 6
  # | 0 1 2 3 4 5 6 7 8 9 | 7
  # | 0 1 2 3 4 5 6 7 8 9 | 8
  # | 0 1 2 3 4 5 6 7 8 9 | 9

  def update_move(player, col_index)
    row_index = 9
    while @board[row_index][col_index] != " " do
      row_index -= 1
    end
    @last_row = row_index
    @last_column = col_index
    @last_player = player.char
    @board[row_index][col_index] = player.char
    @last_score = 0
  end

  def horizontal_score
    row_index = @last_row
    col_index = @last_column
    while
      col_index >= 0 && @board[row_index][col_index] == @last_player
      col_index -= 1
    end
    col_index += 1
    occurrences = 0
    while @board[row_index][col_index] == @last_player && col_index < 10
      col_index += 1
      occurrences += 1
    end
    return occurrences
  end

  def vertical_score
    row_index = @last_row
    col_index = @last_column
    while row_index < 10 && @board[row_index][col_index] == @last_player
      row_index += 1
    end
    occurrences = 0
    row_index -= 1
    while @board[row_index][col_index] == @last_player && row_index >= 0
      row_index -= 1

      occurrences += 1
    end
    return occurrences
  end

  def diagonal_score
    row_index = @last_row
    col_index = @last_column
    while row_index < 10 && col_index < 10 && @board[row_index][col_index] == @last_player
      row_index += 1
      col_index += 1
    end
    occurrences = 0
    row_index -= 1
    col_index -= 1
    while @board[row_index][col_index] == @last_player && row_index >= 0 && col_index >= 0
      row_index -= 1
      col_index -= 1
      occurrences += 1
    end
    return occurrences
  end

  def diagonal_score2
    row_index = @last_row
    col_index = @last_column
    while row_index < 10 && col_index >= 0 && @board[row_index][col_index] == @last_player
      row_index += 1
      col_index -= 1
    end
    occurrences = 0
    row_index -= 1
    col_index += 1
    while @board[row_index][col_index] == @last_player && row_index >= 0 && col_index < 10
      row_index -= 1
      col_index += 1
      occurrences += 1
    end
    return occurrences
  end

  def win?
    if
    horizontal_score == 4 ||
    vertical_score == 4 ||
    diagonal_score == 4 ||
    diagonal_score2 == 4
      puts "Congratulation! #{@last_player} won."
    end
    return horizontal_score == 4 ||
    vertical_score == 4 ||
    diagonal_score == 4 ||
    diagonal_score2 == 4
  end


  def display
    board_print = ""
    @board.each do |row|
      board_print << "| " + row.join(" ") + "|\n"
    end
    board_print << "  A B C D E F G H I J  "
    puts board_print
  end

end
