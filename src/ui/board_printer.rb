class BoardPrinter
  def initialize(board_mark)
    @board_mark = board_mark
  end

  def display_grid(board)
    grid = board.grid
    grid_length = grid.length

    show_column_index(grid_length)
    show_dash_line(grid_length)

    grid.each_with_index do |row, index|
      index_string = "#{index + 1} "

      if index >= 9
        index_string = "#{index + 1}"
      end
      print("#{index_string}|")
      show_row(row)
      print("|")
      puts
    end

    show_dash_line(grid_length)
  end

  def show_row(row)
    row.each_with_index do |tile, tile_index|
      value = @board_mark

      if tile.flagged
        value = @board.get_flagged_mark
      elsif tile.reveal
        value = tile.mark
      end

      if row.length - 1 != tile_index
        value += "  "
      else
        value += " "
      end


      print "#{value}"

    end
  end

  def show_column_index(size)
    column_index = " "

    (1..size).each do |number|
      column_index += "  #{number}"
    end

    puts(column_index)
  end

  def show_dash_line(length)
    line = "   "
    dash_amount = length * 3 - 1

    dash_amount.times do
      line += "-"
    end

    puts(line)
  end
end
