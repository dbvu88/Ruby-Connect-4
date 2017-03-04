require 'spec_helper'

describe SquareBoard do
  it 'can be initialized with 10 rows and columns by default' do
    board = SquareBoard.new
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  it 'prints the board as below' do
    board = SquareBoard.new
    board_printout =
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "|                     |\n" +
      "  A B C D E F G H I J  "

    # binding.pry
    expect(board.display).to eq(board_printout)
  end

  it 'returns all elements in the same column' do
    board = SquareBoard.new
    expect(board.column(9)).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  it 'keeps track of number of moves' do
    board = SquareBoard.new
    x_player = Player.new("X")
    o_player = Player.new("O")

    board.update_turn(x_player, 9, 9)
    board.update_turn(o_player, 0, 9)
    expect(board.moves).to eq(2)
  end

end
