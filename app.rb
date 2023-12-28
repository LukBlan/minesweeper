require_relative './ui/console_interface'
require_relative './domain/board_factory'

# Domain
board_factory = BoardFactory.new("-", "x")
board = board_factory.create_board(10, 13)

# UI
console_interface = ConsoleInterface.new(board)
console_interface.init