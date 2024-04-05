class StringCalculator
  class InvalidInputError < StandardError; end
  class NegativeNumberError < StandardError
    def initialize(number)
      super("negative numbers not allowed #{number.join(', ')}")
    end
  end

  DEFAULT_DELIMETER = Regexp.new('[,\n]')

  def add(numbers)
    return 0 if numbers.empty?

    validate_input!(numbers)

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    numbers_arr = numbers.split(/#{delimiter}/)
    validate_numbers!(numbers_arr)

    numbers_arr.reduce(0) { |sum, number| sum + number.to_i }
  end

  private

  def validate_input!(numbers)
    raise InvalidInputError, numbers if numbers.end_with?("\n") || numbers.end_with?(',')
  end

  def validate_numbers!(numbers_arr)
    negative_numbers = numbers_arr.select { |number| number.to_i.negative? }
    return if negative_numbers.empty?

    raise NegativeNumberError, negative_numbers
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
