# bubble sort

module BubbleSort
  def self.sort(c)
    0.upto(c.size-1) do |i|
      (c.size-1).downto(i+1) do |j|
        p = block_given? ? yield(c[j], c[j-1]) : c[j] <=> c[j-1]
        c[j-1], c[j] = c[j], c[j-1] if p == -1
      end
    end
    c
  end
end
