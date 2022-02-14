class Diamond
  ALPHABET = ('A'..'Z').to_a

  class << self
    def make_diamond(letter)
      range = make_range_array(letter)
      width = determine_width(letter)
      diamond = []
      range.each { |char| diamond << make_row(char).center(width) }
      diamond.join("\n") + "\n"
    end

    private

    def determine_width(letter)
      return 1 if letter == 'A'
      determine_spaces(letter).size + 2
    end

    def make_row(letter)
      case letter
      when 'A' then 'A'
      when 'B' then 'B B'
      else
        "#{letter}#{determine_spaces(letter)}#{letter}"
      end
    end

    def determine_spaces(letter)
      case letter
      when 'A' then ''
      when 'B' then ' '
      when 'C' then '   '
      else
        range = ('D'..letter)
        spaces = '   '
        range.each { spaces += '  ' }
        spaces
      end
    end

    def make_range_array(letter)
      full_range = []
      up_range = ('A'..letter).to_a
      up_range.each { |char| full_range << char }
      up_range.reverse_each { |char| full_range << char unless char == letter }
      full_range
    end
  end
end

Diamond.make_diamond('E')
