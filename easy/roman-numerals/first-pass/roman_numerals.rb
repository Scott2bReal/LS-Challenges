class RomanNumeral
  ROMAN_NUMERALS = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''

    ROMAN_NUMERALS.each do |letter, value|
      while value <= @number
        roman_numeral << letter
        @number -= value
      end
    end

    roman_numeral
  end
end
