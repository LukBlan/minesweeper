class ConsoleInterface
  def initialize(board)
    @board = board
  end

  def init
    display_grid
    row = 5
    column = 5
    @board.reveal([row, column])
    puts("---------------------")
    display_grid
  end

  def display_grid
    grid = @board.grid

    grid.each do |row|
      row.each do |tile|
        value = "*"

        if tile.reveal
          value = tile.mark
        end

        print "#{value} "
      end
      puts
    end
  end
end
