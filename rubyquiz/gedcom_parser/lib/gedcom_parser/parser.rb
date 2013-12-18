class Parser
  def initialize(output)
    @output = output
  end

  def open_ged_file(file)
    if file.strip.empty?
      @output.puts "Can't parse without a GEDCOM file name"
      exit
    end

    if not File.exists?(file)
      @output.puts "File doesn't exist" if not File.exists? file
      exit
    end

    fh = File.open(file)

    if File.zero?(fh)
      @output.puts "File is empty"
      exit
    end

    fh
  end

  # Read each line in the file and verify that each line is minimally
  # formatted.
  #
  # This only checks that each line in the GED file begins with a zero or a
  # positive digit and is then followed by an id or a 3- or 4-letter code.
  #
  # So this won't pick up this kind of error:
  #   2 @S003208@
  #
  # When the line should be:
  #   2 SOUR @S003208@
  def verify_ged_file(file)
    @output.puts "Verifying file ..."

    file.each_line do |line|
      if /^\d+ +(@[A-Z0-9]+@|[A-Z]{3,4})/.match(line) == nil and line.strip != ""
        @output.puts "File isn't properly formatted: error on line #{file.lineno}"
        exit
      end
    end

    @output.puts "File looks good ..."

    file.rewind
    file
  end

  def parse(file)
    @output.puts "Parsing ..."

    fh = open_ged_file(file)
    fh = verify_ged_file(fh)

    parse_stack = []

    outfile = File.open('output.xml', 'w')
    outfile << "<gedcom>"

    fh.each_line do |line|
      next if line.strip == ""

      md = /^(?<level>\d+)\s+(?<tag>@[A-Z0-9]+@|[A-Z]{3,4})\s+(?<data>.*)/.match(line)

      if parse_stack.last and md[:level].to_i == parse_stack.last[0]
        outfile << "</#{parse_stack.pop[1]}>"
      elsif parse_stack.last and md[:level].to_i < parse_stack.last[0]
        outfile << "</#{parse_stack.pop[1]}>"
        outfile << "\n" << "  " * (md[:level].to_i + 1)
        outfile << "</#{parse_stack.pop[1]}>"
      end

      outfile << "\n" << "  " * (md[:level].to_i + 1)
      if md[:tag].start_with?('@')
        outfile << "<#{md[:data].downcase} id=\"#{md[:tag]}\">"
        parse_stack.push([md[:level].to_i, md[:data].downcase])
      else
        outfile << "<#{md[:tag].downcase}>#{md[:data]}"
        parse_stack.push([md[:level].to_i, md[:tag].downcase])
      end
    end

    outfile << "</#{parse_stack.pop[1]}>"
    parse_stack.reverse_each do |tag|
      outfile << "\n" << "  " * (tag[0].to_i + 1)
      outfile << "</#{tag[1]}>"
    end

    outfile << "\n</gedcom>\n"
  end
end
