class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError unless valid_triangle?
  end

  attr_reader :sides

  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid_triangle?
    sorted_sides = sides.sort
    return false if sides.any? { |side| side <= 0 }
    return false if (sorted_sides[0] + sorted_sides[1]) <= sorted_sides[2]
    true
  end

  def equilateral?
    return true if sides.uniq.size == 1
    false
  end

  def isosceles?
    return true if sides.uniq.size == 2
  end
end
