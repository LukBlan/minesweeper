class ConsoleInterface
  def initialize(board, user_input_getter)
    @board = board
    @user_input_getter = user_input_getter
  end

  def init
    game_loop
    show_game_over
  end

  def game_loop
    until @board.game_over?
      system("clear")
      display_grid
      position = @user_input_getter.get_position
      p position
      @board.reveal(position)
    end
  end

  def show_game_over
    system("clear")
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
