require_relative 'src/ui/ole_interface'
require_relative 'src/domain/board_factory'

# Domain
board_factory = BoardFactory.new("-", "x")
board = board_factory.create_board(10, 13)

# UI
console_interface = ConsoleInterface.new(board)
console_interface.init