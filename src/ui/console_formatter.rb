class ConsoleFormatter
  def initialize(line_length)
    @line_length = line_length
  end

  def get_dash_line
    line = ""

    @line_length.times do
      line += "-"
    end

    line
  end

  def get_text_in_middle(text)
    new_text = ""
    console_middle_point = @line_length / 2
    text_middle_point_offset = text.length / 2
    empty_spaces_amount = console_middle_point - text_middle_point_offset

    empty_spaces_amount.times do
      new_text += " "
    end

    new_text + text
  end
end
