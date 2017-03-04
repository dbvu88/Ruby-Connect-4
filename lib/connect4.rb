# require_relative 'square_board'
# require_relative 'player'
# require_relative 'board_unit'
# require_relative 'player_turn'
#
# class ConnectFour
#   def initialize (first_player = "x", second_player = "o", board = SquareBoard.new)
#     @first_player = first_player
#     @second_player = second_player
#     @board = board
#     @players = [first_player, second_player].shuffle
#   end
#
#   def start_game
#     turn_index = 0
#
#     #game loop
#     while !board.winner_found?
#       current_player = players[turn_index]
#       puts "It is #{current_player.char} turn."
#
#       column_id = ("a".."j").to_a
#       col_index = "z"
#       while column_id.include?(col_index)
#         print "What column do you want to drop your piece?(a-j) "
#         col_index = column_id.index(gets.chomp)
#       end
#
#       while !board.column(col_index).include?(" ")
#         puts "this column is full"
#       end
#
#       row_index = 9
#       while @board[row_index][col_index].occupied?
#         row_index -= 1
#       end
#       board.add_turn(current_player, row_index, col_index)
#
#       puts board.display
#
#       turn_index = turn_index == 0 ? 1 : 0
#     end
#   end
#
# end
