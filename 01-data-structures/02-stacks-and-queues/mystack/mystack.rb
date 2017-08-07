class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @top = stack[0]
    @bottom = stack.length - 1
  end

  def push(item)
    @stack << item
    @top = stack[0]
    @bottom = stack.length - 1
  end

  def pop
    @stack.pop
    @top = stack[0]
    @bottom = stack.length - 1
  end

  def empty?
    if stack.count != 0
      return false
    end
  end
end
