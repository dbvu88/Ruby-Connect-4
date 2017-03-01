require_relative "board"
require_relative "player"

#create new players
player1 = "00"
player2 = "00"

while player1.size != 1
  print "Hi Player 1, please type one your favorite characters to begin: "
  player1 = gets.chomp
end

while player2.size != 1
  print "Hi Player 2, please type one your favorite characters to begin: "
  player2 = gets.chomp
end

player_1 = Player.new(player1)
player_2 = Player.new(player2)

# game start
board = Board.new
board.display

def turn(game_board, player)
  col = "3"
  while !("a".."j").to_a.include?(col)
    print "Player #{player.char}, please specify a comlumn to place your move(a-j): "
    col = gets.chomp
  end

  col_index = 0
  ("a".."j").to_a.each_with_index do |char, index|
    if char == col then col_index = index end
  end

  game_board.update_move(player, col_index)
  game_board.display
  return game_board.win?
end

player1_win = false
player2_win = false
while !player2_win
  if turn(board, player_1)
    break
  else
    player2_win = turn(board, player_2)
  end
end
