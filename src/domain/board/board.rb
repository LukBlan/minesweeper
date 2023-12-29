class Board
  attr_reader :grid

  def initialize(grid, board_factory, bombs_amount)
    @grid = grid
    @board_factory = board_factory
    @last_tile_selected = nil
    @bombs_amount = bombs_amount
    @already_reveal = []
  end

  def game_over?
    game_win? || game_lose?
  end

  def move_not_already_made?(position)
    !@already_reveal.include?(position)
  end

  def game_win?
    bombs_flagged = @grid.map do |row|
      row.count { |tile| tile.flagged && tile.bomb }
    end

    bombs_flagged.sum == @bombs_amount
  end

  def game_lose?
    @last_tile_selected != nil && @last_tile_selected.bomb
  end

  def reveal(position)
    row, column = *position
    tile = grid[row][column]
    tile_mark = tile.mark
    tile.toggle_reveal
    @last_tile_selected = tile
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
