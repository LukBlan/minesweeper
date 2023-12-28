require_relative './board'

class BoardFactory
  def initialize(empty_mark, bomb_mark)
    @empty_mark = empty_mark
    @bomb_mark = bomb_mark
  end

  def create_board(size, bombs_amount)
    row = generate_empty_row(size)
    board = generate_empty_board(row, size)
    Board.new(board)
  end

  def generate_empty_board(row, size)
    board = []

    size.times do
      board << row
    end

    board
  end

  def generate_empty_row(size)
    row = []

    size.times do
      row << @empty_mark
    end

    row
  end
end
