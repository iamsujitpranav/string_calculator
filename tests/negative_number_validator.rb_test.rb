require 'minitest/autorun'
require_relative '../negative_number_validator'

class NegativeNumberValidatorTest < Minitest::Test
  def test_negative_numbers
    assert_raises(RuntimeError) { NegativeNumberValidator.validate([1, -2, 3]) }
  end
end