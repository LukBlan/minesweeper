# frozen_string_literal: true

class BoardPrinter
  def initialize(board_mark)
    @board_mark = board_mark
  end

  def display_grid(board)
    grid = board.grid

    grid.each do |row|
      show_row(row)
      puts
    end
  end

  def show_row(row)
    row.each do |tile|
      value = "*"

      if tile.flagged
        value = @board.get_flagged_mark
      elsif tile.reveal
        value = tile.mark
      end

      print "#{value} "
    end
  end
end
