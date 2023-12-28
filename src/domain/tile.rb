class Tile
  attr_reader :bomb, :reveal
  attr_accessor :mark

  def initialize(mark, bomb)
    @mark = mark
    @bomb = bomb
    @reveal = false
  end

  def toggle_reveal
    @reveal = !@reveal
  end
end
