class RomanNumeral
  NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def to_roman
    roman_numeral = ''

    NUMERALS.each do |number, numeral|
      while number <= input
        self.input -= number
        roman_numeral << numeral
      end
    end

    roman_numeral
  end
end
