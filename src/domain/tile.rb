class Tile
  attr_reader :bomb, :reveal, :flagged
  attr_accessor :mark

  def initialize(mark, bomb)
    @mark = mark
    @bomb = bomb
    @reveal = false
    @flagged = false
  end

  def toggle_reveal
    @reveal = !@reveal
  end
end
