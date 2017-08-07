class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[queue.length - 1]
  end

  def enqueue(element)
    @queue.unshift(element)
    @head = @queue[0]
    @tail = @queue[queue.length - 1]
  end

  def dequeue
    @queue.shift
    @head = @queue[0]
    @tail = @queue[queue.length - 1]
  end

  def empty?
    if @queue.length != 0
      return false
    end
  end
end
