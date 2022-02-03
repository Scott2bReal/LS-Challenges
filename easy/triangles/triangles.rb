class Triangle
  attr_reader :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
    check_sides
  end

  def kind
    case
    when equilateral? then "equilateral"
    when isosceles?   then "isosceles"
    when scalene?     then "scalene"
    end
  end

  private
  
  def equilateral?
    return true if sides.uniq.size == 1
    false
  end

  def isosceles?
    return true if sides.uniq.size == 2
    false
  end

  def scalene?
    return true if sides.uniq.size == 3
    false
  end
  
  def check_sides
    # Check for:
    no_zeroes
    no_negatives
    inequality
  end

  def no_zeroes
    @sides.each { |side| raise ArgumentError if side.zero? }
  end

  def no_negatives
    @sides.each { |side| raise ArgumentError if side.negative? }
  end

  def inequality
    case
    when (@side1 + @side2) <= @side3 then raise ArgumentError
    when (@side1 + @side3) <= @side2 then raise ArgumentError
    when (@side2 + @side3) <= @side1 then raise ArgumentError
    end
  end
end
