class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def to(num)
    numbers = (1...num).to_a
    numbers.select { |n| multiple?(n) }.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  private
  
  def multiple?(number)
    @set.each { |num| return true if (number % num).zero? }
    false
  end
end
