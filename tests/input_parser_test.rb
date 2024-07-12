require 'minitest/autorun'
require_relative '../input_parser'

class InputParserTest < Minitest::Test
  def test_default_delimiter
    parser = InputParser.new("1,2\n3")
    assert_equal /[\n,]/, parser.delimiter
  end

  def test_custom_delimiter
    parser = InputParser.new("//;\n1;2")
    assert_equal /;/, parser.delimiter
  end
end
