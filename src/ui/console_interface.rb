class ConsoleInterface
  def initialize(board)
    @board = board
  end

  def init
    grid = @board.grid

    grid.each do |row|
      row.each do |tile|
        value = tile.mark
        print "#{value} "
      end

      puts
    end
  end
end
