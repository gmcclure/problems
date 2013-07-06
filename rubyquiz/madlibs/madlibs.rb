#!/usr/bin/env ruby

class MadLine
  @groups = nil
  @answers = Hash.new
  @g = 0

  def self.next_group
    words = @groups[@g].split(':')
    if not @answers[words[0]]
      word = words.size == 2 ? words[1] : words[0]
      puts "I need " + word + ":"
      @answers[words[0]] = gets.chomp
    end
    @g += 1
  end

  def self.print_answer(line)
    @answers.keys.each do |key|
      line.gsub!( /\(\(#{key}\b:?.*?\)\)/, @answers[key] )
    end
    puts "\n" + line + "\n"
    @groups = nil
    @answers = Hash.new
    @g = 0
  end

  def self.process(line)
    @groups = line.scan( /\(\((.*?)\)\)/ ).flatten
    next_group while @g < @groups.size
    print_answer(line)
  end
end

prompts_file = "prompts.txt"

if File.exists? prompts_file
  prompts = File.open(prompts_file, "r")
  prompts.each_line do |line|
    MadLine.process(line)
  end
else
  puts "No prompts!"
end
