require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(data)
    if @head === nil && @tail === nil
      @head = data
      @tail = @head
      @tail.next = nil
    else
      @tail.next = data
      @tail = data
      @tail.next = nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_code = @head
    if @tail === false
      nil
    elsif current_code === @tail
      @tail.next = nil
      @tail = nil
      current_code = nil
      @head.next = nil
      @head = nil
    elsif current_code.next === @tail
      @tail = current_code
      @tail.next = nil
    else
      current_code = current_code.next
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts current_node.key + ":" + current_node.value
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node === false
      nil
    elsif @head === node && @tail === node
      @tail.next = nil
      @tail = nil
      @head.next = nil
      @head = nil
    elsif @head === node
      @head = @head.next
    else
      previous = @head
      current = @head.next
      until current === nil
        if current === node && current === @tail
          @tail = previous
          break
        elsif current === node && current != @tail
          previous.next = current.next
          break
        else
          previous = current
          current = current.next
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    def add_to_front(node)
      if @head === nil && @tail === nil
        @head = node
        @tail = @head
        @tail.next = nil
      else
        temp = @head
        @head = node
        @head.next = temp
      end
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head === nil
      return @head
    else
      temp = @head
      @head = @head.next
      return temp
    end
  end
end
