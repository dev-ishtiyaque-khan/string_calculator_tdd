require './lib/string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    shared_examples 'calculate sum of input' do |numbers, sum|
      it "returns #{sum} for input #{numbers}" do
        expect(calculator.add(numbers)).to eq(sum)
      end
    end

    include_examples 'calculate sum of input', '', 0
    include_examples 'calculate sum of input', '1', 1
    include_examples 'calculate sum of input', '1,5', 6
  end
end
