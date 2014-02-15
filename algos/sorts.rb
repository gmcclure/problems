##
# sorts.rb
# A module of the usual sorting suspects.

module Sorts

  def self.bubble_sort(c)
    0.upto(c.size-1) do |i|
      swapped = false
      (c.size-1).downto(i+1) do |j|
        p = block_given? ? yield(c[j], c[j-1]) : c[j] <=> c[j-1]
        if p == -1
          c[j-1], c[j] = c[j], c[j-1]
          swapped = true
        end
      end
      break if not swapped
    end
    c
  end

end
