require './input_parser'
require './negative_number_validator'

class StringCalculator
  def self.add(input)
    parser = InputParser.new(input)
    numbers = parser.numbers
    validate_numbers(numbers)
    numbers.sum
  end

  def self.validate_numbers(numbers)
    NegativeNumberValidator.validate(numbers)
  end
end
