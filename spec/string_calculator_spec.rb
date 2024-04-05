require './lib/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    shared_examples 'calculate sum of input' do |numbers, sum|
      it "returns #{sum} for input #{numbers.inspect}" do
        expect(calculator.add(numbers)).to eq(sum)
      end
    end

    shared_examples 'raise error for invalid input' do |numbers|
      it "raises error for input #{numbers.inspect}" do
        expect { calculator.add(numbers) }.to raise_error(described_class::InvalidInputError, numbers)
      end
    end

    shared_examples 'raise error for negative numbers' do |numbers, negative_numbers|
      it "raises error for input #{numbers.inspect}" do
        expect { calculator.add(numbers) }
          .to raise_error(
            described_class::NegativeNumberError,
            /negative numbers not allowed #{negative_numbers}/
          )
      end
    end

    context 'with valid input' do
      context 'with default delimiter' do
        include_examples 'calculate sum of input', '', 0
        include_examples 'calculate sum of input', '1', 1
        include_examples 'calculate sum of input', '1,5', 6
        include_examples 'calculate sum of input', '1,3,6', 10
        include_examples 'calculate sum of input', "1\n2,3", 6
      end

      context 'with custom delimiter' do
        include_examples 'calculate sum of input', "//;\n1;2", 3
      end
    end

    context 'with invalid input' do
      include_examples 'raise error for invalid input', "1,\n"
      include_examples "raise error for invalid input", "1\n2,3,"
    end

    context 'with negative numbers' do
      include_examples 'raise error for negative numbers', '1,-1', '-1'
      include_examples 'raise error for negative numbers', "2\n-1,-4,3", '-1, -4'
    end
  end
end
