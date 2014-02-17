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

  def self.insertion_sort(c)
    1.upto(c.size-1) do |i|
      j = i
      while j > 0
        p = block_given? ? yield(c[j-1], c[j]) : c[j-1] <=> c[j]
        c[j-1], c[j] = c[j], c[j-1] if p == 1
        j -= 1
      end
    end
    c
  end

  def self.merge_sort(c)
    return c if c.size <= 1
    m = c.size/2
    l = c[0, m]
    r = c[m, c.size-m]
    merge(merge_sort(l), merge_sort(r))
  end

  def self.merge(l, r)
    s = []
    until l.empty? or r.empty?
      if l.first <= r.first
        s << l.shift
      else
        s << r.shift
      end
    end
    s + l + r
  end

end
