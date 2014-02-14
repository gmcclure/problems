# bubble sort


class BubbleSorter

  def self.sort(c)
    (c.size ** 2).times do
      for i in (0...c.size)
        if i < c.size - 1
          p = block_given? ? yield(c[i+1], c[i]) : c[i+1] <=> c[i]
          c[i], c[i+1] = c[i+1], c[i] if p == -1
        end
      end
    end

    c
  end

end
