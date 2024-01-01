class PositionBasedCommand
  def initialize(proc)
    @proc = proc
  end

  def execute(board, user_input_hash)
    position = user_input_hash["position"]
    @proc.call(board, position)
  end

  def valid_parameter?(input_position, board)
    have_single_comma?(input_position) && inside_board_range(board, input_position)
  end

  def inside_board_range(board, input_position)
    position = parse_position(input_position)
    board_length = board.get_length
    row, column = *position
    row >= 0 && row < board_length && column >= 0 && column < board_length
  end

  def parse_position(user_input_position)
    user_input_position.split(",").map {|number| number.to_i - 1}
  end

  def map_user_input(user_input_hash, parameter)
    user_input_hash["position"] = parse_position(parameter)
    user_input_hash
  end


  def have_single_comma?(input_position)
    input_position.chars.count { |char| char == "," } == 1
  end
end
