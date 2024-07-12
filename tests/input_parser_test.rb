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

  def test_invalid_input
    parser = InputParser.new("1,\n2")
    assert_raises(RuntimeError) { parser.numbers }
  end

  def test_numbers_with_default_delimiter
    parser = InputParser.new("1,2\n3")
    assert_equal [1, 2, 3], parser.numbers
  end

  def test_numbers_with_custom_delimiter
    parser = InputParser.new("//;\n1;2")
    assert_equal [1, 2], parser.numbers
  end
  
end
