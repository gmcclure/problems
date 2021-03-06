require 'spec_helper'


module GEDCOMParser
  describe Parser do
    let(:output) { double('output').as_null_object }
    let(:parser) { Parser.new(output) }

    describe '#open_ged_file' do
      it "complains and stops whine when run without a filename" do
        output.should_receive(:puts).with("Can't parse without a GEDCOM file name")
        lambda { parser.open_ged_file('') }.should raise_error SystemExit
      end

      it "complains and stops if the filename doesn't exist" do
        output.should_receive(:puts).with("File doesn't exist")
        lambda { parser.open_ged_file('nonexistent-file') }.should raise_error SystemExit
      end

      it "complains and stops if the supplied file is empty" do
        output.should_receive(:puts).with("File is empty")
        lambda { parser.open_ged_file('spec/support/data/empty-file.ged') }.should raise_error SystemExit
      end
    end

    describe "#verify_ged_file" do
      it "complains and stops if each line in the file doesn't begin with a number, whitespace, and an identifier" do
        fh = parser.open_ged_file('spec/support/data/malformed-ged-file.ged')
        output.should_receive(:puts).with("File isn't properly formatted: error on line 7")
        lambda { parser.verify_ged_file(fh) }.should raise_error SystemExit
      end

      it "says the file looks good if it passed verification" do
        fh = parser.open_ged_file('spec/support/data/good-ged-file.ged')
        output.should_receive(:puts).with("File looks good ...")
        parser.verify_ged_file(fh)
      end
    end

    describe "#parse" do
      it "outputs a minimally correct file when given a small sample input file" do
        parser.parse('spec/support/data/sample-1.ged')
        output_file = File.open('output.xml')
        output_file.should have_content_identical_to 'spec/support/data/sample-1.xml'
      end
    end
  end
end
