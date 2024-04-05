class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.include?(',')
      first_number, second_number = numbers.split(',')
      first_number.to_i + second_number.to_i
    else
      numbers.to_i
    end
  end
end
