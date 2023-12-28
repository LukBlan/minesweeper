class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def reveal(position)
    row, column = *position
    tile = grid[row][column]
    tile.toggle_reveal
  end
end
