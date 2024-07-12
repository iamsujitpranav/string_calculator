require 'minitest/autorun'
require_relative '../string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_add_method_with_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_invalid_input_comma_newline
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,\n2") }
    assert_equal "Invalid string", exception.message
  end

  def test_invalid_input_newline_comma
    exception = assert_raises(RuntimeError) { StringCalculator.add("1\n,2") }
    assert_equal "Invalid string", exception.message
  end

  def test_invalid_input_ends_with_newline
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,2,\n") }
    assert_equal "Invalid string", exception.message
  end
  
  def test_add_negative_numbers_raises_exception
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
    assert_equal "Negative numbers not allowed: -2, -4", exception.message
  end

  def test_add_two_numbers
    assert_equal 3, StringCalculator.add("1,2")
  end

  def test_add_multiple_numbers
    assert_equal 6, StringCalculator.add("1,2,3")
  end

  def test_add_newline_delimiter
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  def test_add_custom_delimiter
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

end
