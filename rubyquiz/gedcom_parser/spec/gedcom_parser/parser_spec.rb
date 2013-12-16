require 'spec_helper'


module GEDCOMParser
  describe Parser do
    before(:each) do
      @output = double('output').as_null_object
      @parser = Parser.new(@output)
    end

    describe '#open_ged_file' do
      it "should give an error when run without a filename" do
        @output.should_receive(:puts).with("Can't parse without a GEDCOM file name")
        lambda { @parser.open_ged_file('') }.should raise_error SystemExit
      end

      it "complains if the filename doesn't exist" do
        @output.should_receive(:puts).with("File doesn't exist")
        lambda { @parser.open_ged_file('nonexistent-file') }.should raise_error SystemExit
      end

      it "complains if the supplied file is empty" do
        @output.should_receive(:puts).with("File is empty")
        lambda { @parser.open_ged_file('spec/data/empty-file.ged') }.should raise_error SystemExit
      end
    end

    describe "#verify_ged_file" do
      it "complains if each line in the file doesn't begin with a number, some space, and an identifier" do
        fh = @parser.open_ged_file('spec/data/malformed-ged-file.ged')
        @output.should_receive(:puts).with("File isn't properly formatted: error on line 7")
        lambda { @parser.verify_ged_file(fh) }.should raise_error SystemExit
      end

      it "says the file looks good if it passed verification" do
        fh = @parser.open_ged_file('spec/data/good-ged-file.ged')
        @output.should_receive(:puts).with("File looks good ...")
        @parser.verify_ged_file(fh)
      end
    end

    describe "#parse" do
      it "outputs a minimally correct file when given a small sample input file" do
        @parser.parse('spec/data/sample-1.ged')
      end
    end
  end
end
