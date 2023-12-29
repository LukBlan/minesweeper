require_relative "./ui/console_interface"
require_relative './domain/board/board_factory'
require_relative './ui/user_input_getter'

# Domain
board_factory = BoardFactory.new("_", "x", "F")
board = board_factory.create_board(10, 13)

# UI
user_input_getter = UserInputGetter.new
console_interface = ConsoleInterface.new(board, user_input_getter)
console_interface.init