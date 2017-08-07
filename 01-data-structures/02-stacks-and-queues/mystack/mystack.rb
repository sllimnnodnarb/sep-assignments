class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
    @head = stack[0]
    @tail = stack.length - 1
  end

  def push(item)
    @stack << item
    @head = stack[0]
    @tail = stack.length - 1
  end

  def pop
    @stack.pop
    @head = stack[0]
    @tail = stack.length - 1
  end

  def empty?
    if stack.count != 0
      return false
    end
  end
end
