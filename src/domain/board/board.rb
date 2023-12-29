class Board
  attr_reader :grid

  def initialize(grid, board_factory)
    @grid = grid
    @board_factory = board_factory
    @already_reveal = []
  end

  def reveal(position)
    row, column = *position
    tile = grid[row][column]
    tile_mark = tile.mark
    tile.toggle_reveal
    @already_reveal << [row, column]

    if tile_mark == @board_factory.empty_mark
      reveal_adjacent_tiles(row, column)
    end
  end

  def reveal_adjacent_tiles(row, column)
    coordinates = @board_factory.get_coordinates_around_tile(row, column, grid.length)
    coordinates.each do |coordinate|
      if !@already_reveal.include?(coordinate)
         reveal(coordinate)
      end

    end
  end


end
