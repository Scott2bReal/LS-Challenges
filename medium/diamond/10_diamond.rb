class Diamond
  class << self
    def make_diamond(letter)
      # Make outside_buffer
      # Make a center buffer
      # For each letter in letters
      #  make a line with current letter and buffers
      #  add to output_diamond
      #  increment center buffer, decrement outide buffers
      final_diamond = ''
      letters = ('A'..letter).to_a
    end

    def determine_width(letter)
      return 1 if letter == 'A'
    end
  end
end
