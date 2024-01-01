class ConsoleInterface
  attr_accessor :board

  def initialize(board, user_input_getter, console_formatter, board_printer)
    @board = board
    @user_input_getter = user_input_getter
    @console_formatter = console_formatter
    @board_printer = board_printer
  end

  def init(commands_hash)
    print_message_between_dashes("Welcome to Minesweeper")
    puts
    game_loop(commands_hash)
    show_game_over
  end

  def game_loop(commands_hash)
    until @board.game_over?
      @board_printer.display_grid(@board)
      user_input = @user_input_getter.get_user_input(@board, @console_formatter, commands_hash)
      user_input["game-controller"] = self
      command = commands_hash[user_input["command"]]
      command.execute(@board, user_input)
      system("clear")
    end
  end

  def show_game_over
    print_message_between_dashes("Game Over")
    @board_printer.display_grid(@board)
  end

  def print_message_between_dashes(message)
    line = @console_formatter.get_dash_line
    text_in_middle = @console_formatter.get_text_in_middle(message)

    puts(line)
    puts(text_in_middle)
    puts(line)
  end
end
