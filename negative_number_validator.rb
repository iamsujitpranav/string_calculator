class NegativeNumberValidator
  def self.validate(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(", ")}" unless negatives.empty?
  end
end