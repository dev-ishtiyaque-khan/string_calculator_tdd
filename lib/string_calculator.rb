class StringCalculator
  class InvalidInputError < StandardError; end

  def add(numbers)
    return 0 if numbers.empty?

    validate_input!(numbers)

    delimiter, numbers = if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      [Regexp.escape(delimiter), numbers]
    else
      [Regexp.new('[,\n]'), numbers]
    end

    numbers.split(/#{delimiter}/).reduce(0) { |sum, number| sum + number.to_i }
  end

  private

  def validate_input!(numbers)
    raise InvalidInputError, numbers if numbers.end_with?("\n") || numbers.end_with?(',')
  end
end
