class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').reduce(0) { |sum, number| sum + number.to_i }
  end
end
