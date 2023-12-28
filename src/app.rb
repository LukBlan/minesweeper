require_relative "./ui/console_interface"
require_relative './domain/board/board_factory'

# Domain
board_factory = BoardFactory.new("_", "x", "F")
board = board_factory.create_board(10, 13)

# UI
console_interface = ConsoleInterface.new(board)
console_interface.init