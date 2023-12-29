
class UserInputGetter
  def get_position(board, console_formatter)
    loop do
      print("Enter a coordinate (row,column) (e.g 3,3): ")
      user_input = gets.chomp

      if valid_position?(user_input, board)
        return parse_position(user_input)
      end

      console_formatter.display_format_message("Invalid Input")
    end
  end

  def valid_position?(user_input, board)
    begin
      position = parse_position(user_input)
      position.length == 2 && board.move_not_already_made?(position)
    rescue Error
      false
    end
  end

  def parse_position(user_input)
    user_input.split(",").map(&:to_i)
  end
end
