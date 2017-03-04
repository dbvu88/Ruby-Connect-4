require 'spec_helper'

describe PlayerTurn do
  it 'make sure that player moves wont crash the program do' do
    board = SquareBoard.new
    x_player = Player.new("X")
    o_player = Player.new("O")
    row_index = 9
    col_index = 9
    turn = PlayerTurn.new(board, x_player, row_index, col_index)
    turn.make_move!
    expect(turn.horizontal_win?).to be(false)
    turn2 = PlayerTurn.new(board, o_player, 9, 8)
    turn.make_move!
    expect(turn2.horizontal_win?).to be(false)
  end

  it "ensures that connected four player moves will result in a win" do
    board1 = SquareBoard.new
    x_player = Player.new("X")
    o_player = Player.new("O")

    turn1 = PlayerTurn.new(board1, o_player, 9, 9)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 9, 8)
    turn2.make_move!
    turn3 = PlayerTurn.new(board1, o_player, 9, 7)
    turn3.make_move!
    turn4 = PlayerTurn.new(board1, o_player, 9, 6)
    turn4.make_move!
    expect(turn4.horizontal_win?).to be(true)

    board2 = SquareBoard.new
    turn1 = PlayerTurn.new(board2, o_player, 9, 8)
    turn1.make_move!
    turn2 = PlayerTurn.new(board2, o_player, 9, 9)
    turn2.make_move!
    turn3 = PlayerTurn.new(board2, o_player, 9, 7)
    turn3.make_move!
    turn4 = PlayerTurn.new(board2, o_player, 9, 6)
    turn4.make_move!
    expect(turn4.horizontal_win?).to be(true)

    board3 = SquareBoard.new
    turn1 = PlayerTurn.new(board3, o_player, 9, 8)
    turn1.make_move!
    turn2 = PlayerTurn.new(board3, o_player, 9, 7)
    turn2.make_move!
    turn3 = PlayerTurn.new(board3, o_player, 9, 6)
    turn3.make_move!
    turn4 = PlayerTurn.new(board3, o_player, 9, 5)
    turn4.make_move!
    expect(turn4.horizontal_win?).to be(true)

    board4 = SquareBoard.new
    turn1 = PlayerTurn.new(board4, o_player, 9, 8)
    turn1.make_move!
    turn2 = PlayerTurn.new(board4, o_player, 9, 7)
    turn2.make_move!
    turn3 = PlayerTurn.new(board4, o_player, 9, 6)
    turn3.make_move!
    turn4 = PlayerTurn.new(board4, x_player, 9, 5)
    turn4.make_move!
    turn = PlayerTurn.new(board4, o_player, 9, 4)
    turn.make_move!
    expect(turn.horizontal_win?).to be(false)

    board4 = SquareBoard.new
    turn1 = PlayerTurn.new(board4, o_player, 9, 8)
    turn1.make_move!
    turn2 = PlayerTurn.new(board4, x_player, 9, 7)
    turn2.make_move!
    turn3 = PlayerTurn.new(board4, o_player, 9, 6)
    turn3.make_move!
    turn4 = PlayerTurn.new(board4, o_player, 9, 5)
    turn4.make_move!
    turn = PlayerTurn.new(board4, o_player, 9, 4)
    turn.make_move!
    expect(turn.horizontal_win?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 9, 9)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 8, 9)
    turn2.make_move!
    turn3 = PlayerTurn.new(board1, o_player, 7, 9)
    turn3.make_move!
    turn4 = PlayerTurn.new(board1, o_player, 6, 9)
    turn4.make_move!
    expect(turn4.vertical_win?).to be(true)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 9, 9)
    turn1.make_move!
    expect(turn1.diagonal_win1?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 9, 9)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 8, 8)
    turn2.make_move!
    turn3 = PlayerTurn.new(board1, o_player, 7, 7)
    turn3.make_move!
    turn4 = PlayerTurn.new(board1, o_player, 6, 6)
    turn4.make_move!
    expect(turn4.diagonal_win1?).to be(true)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 6, 6)
    turn1.make_move!
    expect(turn1.diagonal_win1?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 0, 0)
    turn1.make_move!
    expect(turn1.diagonal_win1?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 9, 0)
    turn1.make_move!
    expect(turn1.diagonal_win1?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 8, 0)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 9, 1)
    turn2.make_move!
    expect(turn2.diagonal_win1?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 0, 8)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 1, 9)
    turn2.make_move!
    expect(turn2.diagonal_win2?).to be(false)

    board1 = SquareBoard.new
    turn1 = PlayerTurn.new(board1, o_player, 9, 0)
    turn1.make_move!
    turn2 = PlayerTurn.new(board1, o_player, 0, 0)
    turn2.make_move!
    expect(turn2.diagonal_win2?).to be(false)

    board = SquareBoard.new
    turn1 = PlayerTurn.new(board, o_player, 9, 9)
    turn1.make_move!
    expect(turn1.diagonal_win2?).to be(false)
    turn2 = PlayerTurn.new(board, o_player, 8, 8)
    turn2.make_move!
    turn3 = PlayerTurn.new(board, o_player, 7, 7)
    turn3.make_move!
    turn4 = PlayerTurn.new(board, o_player, 6, 6)
    turn4.make_move!
    expect(turn4.diagonal_win2?).to be(false)

    board = SquareBoard.new
    turn1 = PlayerTurn.new(board, o_player, 3, 0)
    turn1.make_move!
    puts board.display
    turn2 = PlayerTurn.new(board, o_player, 2, 1)
    turn2.make_move!
    puts board.display

    turn3 = PlayerTurn.new(board, o_player, 1, 2)
    turn3.make_move!
    puts board.display

    turn4 = PlayerTurn.new(board, o_player, 0, 3)
    turn4.make_move!
    puts board.display

    expect(turn4.diagonal_win2?).to be(true)


  end
end
