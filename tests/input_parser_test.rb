require 'minitest/autorun'

class InputParserTest < Minitest::Test
  def test_default_delimiter
    parser = InputParser.new("1,2\n3")
    assert_equal /[\n,]/, parser.delimiter
  end
end
