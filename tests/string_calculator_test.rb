require_relative '../string_calculator'

describe StringCalculator do
  describe '.add' do
    context 'when input string is valid' do
      it 'returns the sum of numbers in the input string' do
        input = "1,2\n3"
        expect(StringCalculator.add(input)).to eq(6)
      end
    end

    context 'when input string contains negative numbers' do
      it 'raises an exception' do
        input = "1,-2\n3"
        expect { StringCalculator.add(input) }.to raise_error("Negative numbers not allowed: -2")
      end
    end

    context 'when input string is invalid' do
      it 'raises an exception' do
        input = "1,\n2"
        expect { StringCalculator.add(input) }.to raise_error("Invalid string")
      end
    end
  end

  describe '.validate_numbers' do
    context 'when input array contains negative numbers' do
      it 'raises an exception' do
        numbers = [1, -2, 3]
        expect { StringCalculator.validate_numbers(numbers) }.to raise_error("Negative numbers not allowed: -2")
      end
    end

    context 'when input array does not contain negative numbers' do
      it 'does not raise an exception' do
        numbers = [1, 2, 3]
        expect { StringCalculator.validate_numbers(numbers) }.not_to raise_error
      end
    end
  end
end