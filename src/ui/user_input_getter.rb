
class UserInputGetter
  def get_user_input(board, console_formatter, command_hash)
    loop do
      keys = command_hash.keys
      print("Enter command #{keys} and a coordinate (row,column) (e.g #{keys[0]} 3,3): ")
      user_input = gets.chomp

      if valid_user_input_format(user_input) && valid_command(user_input, keys) && valid_position?(user_input, board)
        return parse_user_input(user_input)
      end

      console_formatter.display_format_message("Invalid Input")
    end
  end

  def valid_user_input_format(user_input)
    user_input.chars.count { |char| char == " " } == 1
  end

  def valid_command(user_input, keys)
    command = user_input.split(" ")[0]
    keys.include?(command)
  end

  def valid_position?(user_input, board)
    user_input_position = user_input.split(" ")

    begin
      position = map_position(user_input_position[1])
      position.length == 2 && board.move_not_already_made?(position)
    rescue Error
      false
    end
  end

  def map_position(position)
    position.split(",").map(&:to_i)
  end

  def parse_user_input(user_input)
    user_input_split = user_input.split(" ")
    command = user_input_split[0]
    position = user_input_split[1].split(",").map(&:to_i)
    {"command" => command, "position" => position}
  end
end
