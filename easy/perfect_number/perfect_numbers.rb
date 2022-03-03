class PerfectNumber
  class << self
    def classify(number)
      raise StandardError if number.negative?

      if deficient?(number)
        'deficient'
      elsif abundant?(number)
        'abundant'
      else
        'perfect'
      end
    end

    private
    
    def deficient?(number)
      return true if divisors(number).sum < number
      false
    end

    def perfect?(number)
      return true if divisors(number).sum == number
      false
    end

    def abundant?(number)
      return true if divisors(number).sum > number
      false
    end

    def divisors(number)
      range = (1...number).to_a
      range.select { |num| (number % num).zero? }
    end
  end
end
