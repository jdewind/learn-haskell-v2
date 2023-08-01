require 'pp'

class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def right_triangle?
    @a**2 + @b**2 == @c**2
  end

  def perimeter
    @a + @b + @c
  end
  
  def self.only_right_triangles(triangles)
    triangles.select { |x| x.right_triangle? }
  end
  
  def self.right_and_with_perimeter_multiple_of(triangles, multiple)
    only_right_triangles(triangles).select { |x| x.perimeter % multiple == 0 }
  end

  def self.generate(num) 
    triangles = []
    range = (1..num).to_a
    range = range.product range, range
    range.map { |(a,b,c)| Triangle.new a, b, c }
  end

  def inspect
    "(#{@a}, #{@b}, #{@c})"
  end
end

if __FILE__ == $0
  if ARGV.count == 2
    triangles = Triangle.generate ARGV[0].to_i
    pp Triangle.right_and_with_perimeter_multiple_of triangles, ARGV[1].to_i
  else
    puts "Wrong number of arguments"
  end

end
