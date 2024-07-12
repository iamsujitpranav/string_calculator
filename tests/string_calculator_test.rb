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

  def test_add_negative_numbers_raises_exception
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
    assert_equal "Negative numbers not allowed: -2, -4", exception.message
  end

end
