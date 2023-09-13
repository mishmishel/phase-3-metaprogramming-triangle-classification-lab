class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    validate_triangle
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  class TriangleError < StandardError
  end  

  def validate_triangle
    sides = [@side1, @side2, @side3].sort
    if sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
      raise TriangleError, "Invalid triangle sides"
    end
  end
end

