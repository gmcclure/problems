class RomanNumerals
  def self.to_roman(n)
    roman_nums = { 1 => {1 => 'I', 5 => 'V' }, 10 => { 1 => 'X', 5 => 'L' }, 100 => { 1 => 'C', 5 => 'D' }, 1000 => { 1 => 'M' } }

    p = 1
    r = ""

    while n > 0 do
      d = (n % (p*10)) / p
      n -= d * p

      case d
      when 1..3
        r = roman_nums[p][1] * d + r
      when 4
        r = roman_nums[p][1] + roman_nums[p][5] + r
      when 5
        r = roman_nums[p][5] + r
      when 6..8
        r = roman_nums[p][5] + (roman_nums[p][1] * (d - 5)) + r
      when 9
        r = roman_nums[p][1] + roman_nums[p*10][1] + r
      end

      p *= 10
    end

    return r
  end

  def self.from_roman(n)
    roman_vals = { 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1 }
    r = 0
    n.size.times do |d|
      v = roman_vals[ n[d] ]

      if n[d+1] != nil and roman_vals[ n[d+1] ] > v
        r -= v
      else
        r += v
      end
    end

    return r
  end
end

if __FILE__ == $0
  puts RomanNumerals.to_roman(10)
end
