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
    place_tile_values(grid)
    Board.new(grid)
  end

  def place_tile_values(grid)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |tile, column_index|
        unless tile.bomb
          bombs_amount = get_bombs_amount(grid, row_index, column_index)

          if bombs_amount > 0
            tile.mark = bombs_amount.to_s
          end

        end
      end
    end
  end

  def get_bombs_amount(grid, row, column)
    tiles_coordinates = get_coordinates_around_tile(row, column, grid.length)
    tiles = tiles_coordinates.map do |coordinate|
      row = coordinate[0]
      column = coordinate[1]
      grid[row][column]
    end

    tiles.count { |tile| tile.bomb }
  end

  def get_coordinates_around_tile(row, column, grid_size)
    coordinates = []
    start_row = row - 1
    start_column = column - 1

    (start_row...start_row + 3).each do |row_index|
      (start_column...start_column + 3).each do |column_index|
        if row_index >= 0 && column_index >= 0 && row_index < grid_size && column_index < grid_size
          coordinates << [row_index, column_index]
        end
      end
    end

    coordinates
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
