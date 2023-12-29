require_relative "./ui/console_interface"
require_relative './domain/board/board_factory'
require_relative './ui/user_input_getter'
require_relative './ui/console_formatter'

# Domain
board_factory = BoardFactory.new("_", "x", "F")
board = board_factory.create_board(10, 13)

# UI
console_formatter = ConsoleFormatter.new(48)
user_input_getter = UserInputGetter.new
console_interface = ConsoleInterface.new(board, user_input_getter, console_formatter)
console_interface.init