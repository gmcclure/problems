class HaveContentIdenticalTo
  def initialize(expected)
    @expected = expected
  end

  def matches?(actual)
    @actual = actual
    FileUtils.identical?(File.expand_path(@actual.path), @expected)
  end

  def failure_message_for_should
    "expected files to be identical, but got this:\n" + %x( diff #{File.expand_path(@actual.path)} #{@expected} )
  end

  def failure_message_for_should_not
    "files are identical"
  end
end

def have_content_identical_to(expected)
  HaveContentIdenticalTo.new(expected)
end
