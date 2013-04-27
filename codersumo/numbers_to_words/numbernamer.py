class NumberNamer(object):
    ones   = ["", "one", "two", "three", "four", "five", 
              "six", "seven", "eight", "nine", "ten", 
              "eleven", "twelve", "thirteen", "fourteen", "fifteen", 
              "sixteen", "seventeen", "eighteen", "nineteen"]

    tens   = ["", "", "twenty", "thirty", "forty", 
              "fifty", "sixty", "seventy", "eighty", "ninety"]

    groups = ["", "thousand", "million", "billion", "trillion", 
              "quadrillion", "quintillion", "sextillion", "septillion", "octillion", 
              "nonillion", "decillion", "undecillion", "duodecillion", "tredecillion", 
              "quattuordecillion", "quindecillion", "sexdecillion", "septendecillion", "octodecillion", 
              "novemdecillion", "vigintillion", "centillion"]

    def convert(self, n):
        words = []                  # word list
        group_idx = 0               # hundreds, thousands, etc.
        n_idx = -3                  # move the idx back until we're done with n, 3 places at a time
        d = n[n_idx:]               # use n_idx to snag the last three digits of n
        while len(d) > 0:
            # handle ones and tens
            int_d = int(d)

            if group_idx > 0:
                words.append(self.groups[group_idx])
            
            if int_d / 10 % 10 < 2: # is the tens digit in the teens or lower?
                if not int_d%100 == 0: # this doesn't handle 'zero', so gotta check for that later
                    words.append(self.ones[int_d%100])
            else:
                ones_digit = int_d%100%10
                if ones_digit > 0:
                    words.append(self.ones[ones_digit])
                words.append(self.tens[int_d%100/10])

            # hundreds digit
            hundreds_digit = int_d/100
            if hundreds_digit > 0:
                words.append('hundred')
                words.append(self.ones[hundreds_digit])

            n_idx -= 3              # move the idx down
            group_idx += 1          # increment the group name    
            d = n[n_idx:n_idx+3]    # and grab any digits left to convert


        if len(words) == 0:
            return 'zero'
        words.reverse()
        return '-'.join(words)


if __name__ == '__main__':
    import sys
    nn = NumberNamer()
    for line in sys.stdin:
        print nn.convert(line.strip())
