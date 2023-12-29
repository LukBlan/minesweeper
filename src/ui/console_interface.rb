class ConsoleInterface
  def initialize(board, user_input_getter, console_formatter)
    @board = board
    @user_input_getter = user_input_getter
    @console_formatter = console_formatter
  end

  def init
    print_message_between_dashes("Welcome to Minesweeper")
    puts
    game_loop
    show_game_over
  end

  def game_loop
    until @board.game_over?
      display_grid
      position = @user_input_getter.get_position
      @board.reveal(position)
      system("clear")
    end
  end

  def show_game_over
    print_message_between_dashes("Game Over")
    display_grid
  end

  def print_message_between_dashes(message)
    line = @console_formatter.get_dash_line
    text_in_middle = @console_formatter.get_text_in_middle(message)

    puts(line)
    puts(text_in_middle)
    puts(line)
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
