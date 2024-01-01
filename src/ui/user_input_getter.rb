
class UserInputGetter
  def get_user_input(board, console_formatter, command_hash)
    loop do
      keys = command_hash.keys
      print("Enter command #{keys} and a coordinate (row,column) (e.g #{keys[0]} 3,3): ")
      user_input = gets.chomp

      if valid_user_input_format(user_input) &&
        valid_command(user_input, keys) &&
        valid_command_parameter?(user_input, command_hash, board)
        return parse_user_input(user_input, command_hash)
      end

      console_formatter.display_format_message("Invalid Input")
    end
  end

  def valid_command_parameter?(user_input, command_hash, board)
    user_input_split = user_input.split(" ")
    command_name = user_input_split[0]
    parameter = user_input_split[1]
    command = command_hash[command_name]
    command.valid_parameter?(parameter, board)
  end

  def valid_user_input_format(user_input)
    user_input.chars.count { |char| char == " " } == 1
  end

  def valid_command(user_input, keys)
    command = user_input.split(" ")[0]
    keys.include?(command)
  end

  def parse_user_input(user_input, command_hash)
    user_input_split = user_input.split(" ")
    command_name = user_input_split[0]
    command = command_hash[command_name]
    command.map_user_input({"command" => command_name}, user_input_split[1])
  end
end
