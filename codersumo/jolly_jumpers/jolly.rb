# 1 4 2 3
# 1 4 2 -1 6
# 789 788 787
# 1 2
# 33 33 33 33
# 12 13 15 18

while line = gets
    vals = line.split(' ')
    absolutes = vals.each_cons(2).map { |a, b| (b.to_i - a.to_i).abs }
    absolutes.sort!
    if absolutes == (1...vals.size).to_a
        puts ":)"
    else
        puts ":("
    end
end
