require_relative '../input_parser'

describe InputParser do
  describe '#delimiter' do
    context 'when input string starts with "//"' do
      it 'returns the delimiter regex pattern extracted from the first line' do
        input = "//;\n1;2;3"
        parser = InputParser.new(input)
        expect(parser.delimiter).to eq(/;/)
      end
    end

    context 'when input string does not start with "//"' do
      it 'returns the default delimiter pattern including newline and comma' do
        input = "1,2\n3"
        parser = InputParser.new(input)
        expect(parser.delimiter).to eq(/[\n,]/)
      end
    end
  end

  describe '#numbers' do
    context 'when input string starts with "//"' do
      it 'returns an array of numbers extracted from the second line' do
        input = "//;\n1;2;3"
        parser = InputParser.new(input)
        expect(parser.numbers).to eq([1, 2, 3])
      end
    end

    context 'when input string does not start with "//"' do
      it 'returns an array of numbers extracted from the first line' do
        input = "1,2\n3"
        parser = InputParser.new(input)
        expect(parser.numbers).to eq([1, 2, 3])
      end
    end

    context 'when input string is invalid' do
      it 'raises an exception' do
        input = "1,\n2"
        parser = InputParser.new(input)
        expect { parser.numbers }.to raise_error("Invalid string")
      end
    end
  end

  describe '#validate_input' do
    context 'when input string is valid' do
      it 'does not raise an exception' do
        input = "1,2\n3"
        parser = InputParser.new(input)
        expect { parser.send(:validate_input) }.not_to raise_error
      end
    end

    context 'when input string is invalid' do
      it 'raises an exception' do
        input = "1,\n2"
        parser = InputParser.new(input)
        expect { parser.send(:validate_input) }.to raise_error("Invalid string")
      end
    end
  end
end
