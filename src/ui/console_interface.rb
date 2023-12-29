class ConsoleInterface
  def initialize(board, user_input_getter)
    @board = board
    @user_input_getter = user_input_getter
  end

  def init
    display_grid
    position = @user_input_getter.get_position
    @board.reveal(position)
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
