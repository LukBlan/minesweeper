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

  def flag_position(position)
    tile = get_tile_from_position(position)
    tile.toggle_flag
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
    tile = get_tile_from_position(position)
    tile_mark = tile.mark
    tile.toggle_reveal
    @last_tile_selected = tile
    @already_reveal << position

    if tile_mark == @board_factory.empty_mark
      reveal_adjacent_tiles(position)
    end
  end

  def reveal_adjacent_tiles(position)
    coordinates = @board_factory.get_coordinates_around_tile(position, grid.length)
    coordinates.each do |coordinate|
      if !@already_reveal.include?(coordinate)
         reveal(coordinate)
      end
    end
  end

  def get_flagged_mark
    @board_factory.flag_mark
  end

  def get_tile_from_position(position)
    row, column = *position
    grid[row][column]
  end

  def get_length
    @grid.length
  end

end
