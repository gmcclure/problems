##
# numbers_to_words

class EnglishIntegerConverter
  def initialize
    @ones   = ["", "one", "two", "three", "four", "five",
               "six", "seven", "eight", "nine", "ten",
               "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen"]

    @tens   = ["", "", "twenty", "thirty", "forty",
               "fifty", "sixty", "seventy", "eighty", "ninety"]

    @groups = ["", "thousand", "million", "billion", "trillion",
               "quadrillion", "quintillion", "sextillion", "septillion", "octillion",
               "nonillion", "decillion", "undecillion", "duodecillion", "tredecillion",
               "quattuordecillion", "quindecillion", "sexdecillion", "septendecillion", 
               "octodecillion", "novemdecillion", "vigintillion", "centillion"]
  end

  def convert_integer(num)
    n = num.to_s.reverse!

    return "zero" if n == 0

    words     = []
    group_idx = 0
    n_idx     = 0
    d         = n[n_idx, 3]

    while not d.nil? and d != ''
      int_d = d.reverse.to_i

      words << @groups[group_idx] if int_d > 0

      teens = int_d / 10 % 10 < 2 ? true : false
      if teens
        words << @ones[ int_d % 100 ]
      else
        words << @ones[ int_d % 100 % 10 ]
      end

      words << @tens[ int_d % 100 / 10 ] if not teens

      if int_d > 99
        words << "hundred"
        words << @ones[ int_d / 100 ]
      end

      n_idx += 3
      group_idx += 1
      d = n[n_idx, 3]
    end

    words.reject { |w| w == ""}.reverse.join(' ')
  end
end
