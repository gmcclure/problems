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
      if /^\d+ +(@[A-Z0-9]+@|[A-Z]{3,4})/.match(line) == nil
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

    File.open('output.xml', 'w') do |f|
      f << "<gedcom>\n"

      f.each_line do |line|
        md = /^(?<level>\d+)\s+(?<tag>@[A-Z0-9]+@|[A-Z]{3,4})\s+(?<data>.*)/.match(line)
        f << "  " * md[:level].to_i
        f << "<#{md[:tag]}>#{md[:data]}</#{md[:tag]}>\n"
      end

      f << "</gedcom>\n"
    end

    fail
  end
end
