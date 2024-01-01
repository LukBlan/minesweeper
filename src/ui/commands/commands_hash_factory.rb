require_relative './file_based_command'
require_relative './position_based_command'
require 'yaml'

class CommandsHashFactory
  def get_command_hash
    command_hash = Hash.new

    flag_proc = Proc.new { |board, position| board.flag_position(position) }
    reveal_proc = Proc.new { |board, position| board.reveal(position) }
    save_game = Proc.new do |board, user_input_hash, file_path, file_extension|
      file_name = user_input_hash["file_name"]
      File.open("#{file_path}/#{file_name}.#{file_extension}", "w") do |file|
        serialized_object = YAML::dump(board)
        file.puts serialized_object
      end
    end

    load_game = Proc.new do |board, user_input_hash, file_path, file_extension|
      file_name = user_input_hash["file_name"]
      game_controller = user_input_hash["game-controller"]
      File.open("#{file_path}/#{file_name}.#{file_extension}", "r") do |file|
        board_object = YAML::load(file, permitted_classes: [Board, Tile, BoardFactory], aliases: true)
        game_controller.board = board_object
      end
    end

    command_hash["flag"] = PositionBasedCommand.new(flag_proc)
    command_hash["reveal"] = PositionBasedCommand.new(reveal_proc)
    command_hash["save"] = FileBasedCommand.new("./../saved-games", "yaml", save_game)
    command_hash["load"] = FileBasedCommand.new("./../saved-games", "yaml", load_game)
    command_hash
  end
end
