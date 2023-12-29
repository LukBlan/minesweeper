class ConsoleInterface
  def initialize(board)
    @board = board
  end

  def init
    display_grid
    position = get_position
    @board.reveal(position)
    display_grid
  end

  def get_position
    loop do
      puts("Enter a coordinate (row,column) (e.g 3,3)")
      user_input = gets.chomp

      if valid_position?(user_input)
        return parse_position(user_input)
      end

      puts("Invalid Input")
    end
  end

  def valid_position?(user_input)
    begin
      parse_position(user_input)
      true
    rescue Error
      false
    end
  end

  def parse_position(user_input)
    user_input.split("").map(&:to_i)
  end

  def display_grid
    grid = @board.grid

    grid.each do |row|
      row.each do |tile|
        value = "*"

        if tile.reveal
          value = tile.mark
        end

        print "#{value} "
      end
      puts
    end
  end
end
