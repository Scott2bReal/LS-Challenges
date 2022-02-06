class Octal
  VALID_OCTAL_DIGITS = %w(0 1 2 3 4 5 6 7)

  def initialize(input)
    @input = input
  end

  def to_decimal
    return 0 unless valid_octal?

    digits = @input.to_s.chars.reverse

    converted = digits.map.with_index do |digit, idx|
      digit.to_i * (8**idx)
    end

    converted.sum
  end

  private

  def valid_octal?
    @input.to_s.chars.each do |digit|
      return false unless VALID_OCTAL_DIGITS.include?(digit)
    end
    true
  end
end
