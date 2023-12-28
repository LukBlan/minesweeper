require_relative './board'
require_relative './../tile'

class BoardFactory
  def initialize(empty_mark, bomb_mark, flag_mark)
    @empty_mark = empty_mark
    @bomb_mark = bomb_mark
    @flag_mark = flag_mark
  end

  def create_board(size, bombs_amount)
    grid = generate_empty_grid(size)
    place_bombs(grid, bombs_amount, size)
    Board.new(grid)
  end

  def place_bombs(grid, bombs_amount, size)
    bombs_amount.times do
      locate_bomb(grid, size)
    end
  end

  def locate_bomb(grid, size)
    random_row = random_number(size)
    random_column = random_number(size)

    if grid[random_row][random_column].mark == @empty_mark
      grid[random_row][random_column] = Tile.new(@bomb_mark, true)
    else
      locate_bomb(grid, size)
    end
  end

  def random_number(size)
    (0...size).to_a.sample
  end

  def generate_empty_grid(size)
    board = []

    size.times do
      row = generate_empty_row(size)
      board << row
    end

    board
  end

  def generate_empty_row(size)
    row = []

    size.times do
      row << Tile.new(@empty_mark, false)
    end

    row
  end
end
