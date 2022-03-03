class Octal
  attr_reader :number

  VALID_OCTAL_DIGITS = %w(0 1 2 3 4 5 6 7)

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid_octal?

    digits = process_for_conversion

    digits.map.with_index do |digit, idx|
      (digit.to_i * (8**idx))
    end.sum

  end

  private

  def valid_octal?
    process_for_conversion.each do |digit|
      return false unless VALID_OCTAL_DIGITS.include?(digit)
    end

    true
  end

  def process_for_conversion
    number.chars.reverse
  end
end
