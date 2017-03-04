require_relative 'square_board'
require_relative 'player'
require_relative 'board_unit'
require_relative 'player_turn'

#initialize players
player1 = "00"
player2 = "00"

while player1.size != 1
  print "Hi first player, please type your own character: "
  player1 = gets.chomp
end

while player2.size != 1 || player2.eql?(player1)
  print "Hi second player, please type your own character: "
  player2 = gets.chomp
end

first_player = Player.new(player1)
second_player = Player.new(player2)

board = SquareBoard.new

puts board.display

players = [first_player, second_player].shuffle
turn_index = 0

#game loop
while !board.winner_found?
  current_player = players[turn_index]
  puts "It is #{current_player.char} turn."

  column_id = ("a".."j").to_a
  col_input = "z"
  while !column_id.include?(col_input)
    print "What column do you want to drop your move?(a-j): "
    col_input = gets.chomp
  end
  col_index = column_id.index(col_input)

  while !board.column(col_index).include?(" ")
    print "this column is full, please select another column to place your move (a-j): "
    col_input = "z"
    while !column_id.include?(col_input)
      col_input = gets.chomp
    end
    col_index = column_id.index(col_input)
  end

  row_index = 9

  while board.rows[row_index][col_index].occupied?
    row_index -= 1
  end

  board.update_turn(current_player, row_index, col_index)
  puts "moves: #{board.moves}"
  puts board.display
  if board.moves == 100
    puts "The board is full and there is no winner."
    break
  end

  turn_index = turn_index == 0 ? 1 : 0
  # require("pry")
  # binding.pry
end

puts board.announce_winner if board.winner_found?
