class PerfectNumber
  def self.classify(number)
    raise StandardError if number.negative?
    return 'deficient' if deficient?(number)
    return 'perfect' if perfect?(number)
    return 'abundant' if abundant?(number)
  end

  class << self
    def factors(number)
      range = (1...number).to_a
      range.select { |factor| (number % factor).zero? }
    end

    def deficient?(number)
      return true if factors(number).sum < number
      false
    end

    def perfect?(number)
      return true if factors(number).sum == number
      false
    end

    def abundant?(number)
      return true if factors(number).sum > number
      false
    end
  end
end
