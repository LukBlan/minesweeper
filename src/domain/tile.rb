class Tile
  attr_reader :mark

  def initialize(mark, bomb)
    @mark = mark
    @bomb = bomb
    @reveal = false
  end
end
