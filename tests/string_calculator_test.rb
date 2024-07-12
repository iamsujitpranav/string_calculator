require 'minitest/autorun'
require_relative '../string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_add_method_with_empty_string
    assert_equal 0, StringCalculator.add("")
  end
end
