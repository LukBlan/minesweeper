class FileBasedCommand
  def initialize(file_path, file_extension, proc)
    @file_path = file_path
    @file_extension = file_extension
    @proc = proc
  end

  def execute(board, user_input_hash)
    file_name =  user_input_hash["file_name"]
    @proc.call(board, file_name, @file_path, @file_extension)
  end

  def map_user_input(user_input_hash, parameter)
    user_input_hash["file_name"] = parameter
    user_input_hash
  end

  def valid_parameter?(parameter, board)
    !parameter.empty?
  end
end
