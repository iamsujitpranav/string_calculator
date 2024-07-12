require 'minitest/autorun'
require_relative '../input_parser'

class InputParserTest < Minitest::Test
  def test_default_delimiter
    parser = InputParser.new("1,2\n3")
    assert_equal /[\n,]/, parser.delimiter
  end
end
