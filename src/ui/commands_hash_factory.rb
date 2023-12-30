class CommandsHashFactory
  def get_command_hash
    flag_position = Proc.new do |board, position|
      board.flag_position(position)
    end

    reveal_position = Proc.new do |board, position|
      board.reveal(position)
    end

    {
      "flag" => flag_position,
      "reveal" => reveal_position
    }
  end
end
