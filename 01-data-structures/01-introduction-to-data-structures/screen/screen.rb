require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @grid = Arr.new(width) { Arr.new(height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @grid[x][y] = pixel
    else
      puts "x/y values out out of bounds"
    end
  end

  def at(x, y)
    if inbounds(x, y)
      return @grid[x][y]
    else
      puts "x/y values out out of bounds"
    end
  end

  private

  def inbounds(x, y)
    if x < 0 || x > @width-1
     puts "x value is out of bounds"
    end

    if y < 0 || y > @height-1
      puts "y value is out of bounds"
    end
  end

end
