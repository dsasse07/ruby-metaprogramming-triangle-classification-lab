require 'pry'

class Triangle
  # write code here
  @@all = []
  attr_reader :side1, :side2, :side3, :sides, :kind
  def initialize (side1, side2, side3)
    @sides = [side1, side2, side3]
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @@all << self

    if self.sides_are_long? && self.valid_sizes?
      self.define_type
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  def sides_are_long?
    self.sides.all?{|side| side >0 }
  end

  def valid_sizes?
    ((self.side1 + self.side2) > self.side3) && ((self.side2 + self.side3) > self.side1) && ((self.side1+self.side3) > self.side2)
  end

  def count_equal_sides
    equal_sides = self.sides.map {|side| self.sides.count(side)}
    equal_sides.count{|side| side > 1}
  end

  def define_type
    case self.count_equal_sides
      when 3
        @kind = :equilateral
      when 2
        @kind = :isosceles
      when 0
        @kind = :scalene
    end
  end

  def self.all
    @@all
  end


end

# tri1 = Triangle.new(3, 3, 3) #equilateral
# tri2 = Triangle.new(3, 3, 1) #isosceles
# tri3 = Triangle.new(3, 2, 1) #Scalene
# # # tri4 = Triangle.new(0, 2, 3) #invalid
# tri5 = Triangle.new(7,3,2)
# binding.pry
0