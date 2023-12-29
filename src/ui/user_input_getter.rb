
class UserInputGetter
  def get_position
    loop do
      print("Enter a coordinate (row,column) (e.g 3,3): ")
      user_input = gets.chomp

      if valid_position?(user_input)
        return parse_position(user_input)
      end

      puts("Invalid Input")
    end
  end

  def valid_position?(user_input)
    begin
      position = parse_position(user_input)
      position.length == 2
    rescue Error
      false
    end
  end

  def parse_position(user_input)
    user_input.split(",").map(&:to_i)
  end
end
