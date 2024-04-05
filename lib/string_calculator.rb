class StringCalculator
  class InvalidInputError < StandardError; end

  DEFAULT_DELIMETER = Regexp.new('[,\n]')

  def add(numbers)
    return 0 if numbers.empty?

    validate_input!(numbers)

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    numbers.split(/#{delimiter}/).reduce(0) { |sum, number| sum + number.to_i }
  end

  private

  def validate_input!(numbers)
    raise InvalidInputError, numbers if numbers.end_with?("\n") || numbers.end_with?(',')
  end

  def extract_delimiter_and_numbers(numbers)
    delimiter = DEFAULT_DELIMETER
    delimiter_match = numbers.match(/\/\/(.*)\n(.*)/)

    if delimiter_match
      delimiter = Regexp.escape(delimiter_match[1])
      numbers = delimiter_match[2]
    end

    [delimiter, numbers]
  end
end
