class BingoCard
  attr_reader :layout

  def initialize
    @layout = Array.new(5) { Hash.new }
    prng = Random.new
    ranges = [1..15, 16..30, 31..45, 46..60, 61..75]
    @layout.each_with_index do |col, i|
      col[ prng.rand(ranges[i]) ] = nil until col.size == 5
    end
  end
end
