class StringCalculator
  class InvalidInputError < StandardError; end

  def add(numbers)
    return 0 if numbers.empty?

    validate_input!(numbers)

    numbers.split(/[,\n]/).reduce(0) { |sum, number| sum + number.to_i }
  end

  private

  def validate_input!(numbers)
    raise InvalidInputError, numbers if numbers.end_with?("\n")
  end
end
