#!/usr/bin/env ruby


require 'optparse'

class LCDNum
  def initialize(n, s)
    @mtrx = [ 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 
              0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
              0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 
              0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 
              0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 
              0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 
              0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 
              0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
              0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 
              0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0 ]

    @num = n
    @sz = s != nil ? s : 1 
  end

  def to_s
    ret = ""
    5.times do |idx|
      str = ""
      ch = idx%2 == 0 ? '-' : '|'
      @num.each_char do |n|
        d = n.to_i*15 + idx*3
        
        3.times do |x|
          if @mtrx[d+x] == 1
            str += ch == '-' ? ch * @sz : ch
          else
            str += x % 2 == 1 ? " " * @sz : " "
          end
        end

        str += " "
      end
      if ch == '|'
        @sz.times do
          ret += str + "\n"
        end
      else
        ret += str + "\n"
      end
    end
    ret
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: lcd.rb [-s] <number>"

  opts.on("-s", "--size [INTEGER]", Integer, "Specify size in segments") do |s|
    options[:size] = s
  end
end.parse!

puts LCDNum.new(ARGV[0], options[:size])
