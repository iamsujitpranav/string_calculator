require_relative '../negative_number_validator'

describe NegativeNumberValidator do
  describe '.validate' do
    context 'when there are no negative numbers' do
      it 'does not raise an exception' do
        numbers = [1, 2, 3]
        expect { NegativeNumberValidator.validate(numbers) }.not_to raise_error
      end
    end

    context 'when there are negative numbers' do
      it 'raises an exception with the list of negative numbers' do
        numbers = [1, -2, 3, -4]
        expect { NegativeNumberValidator.validate(numbers) }.to raise_error("Negative numbers not allowed: -2, -4")
      end
    end
  end
end