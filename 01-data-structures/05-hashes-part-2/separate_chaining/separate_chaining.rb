require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :item_count

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
    @max_load_factor = 0.7
  end

  #does the key exist in the linked list already?
  #if yes, then check value or update value if need be
  #if no, add a whole new item to the list (make sure to update item count after doing this)
  #ie. @items[index(key, @items.length)]
  def []=(key, value)
    index =  self.index(key, @items.length)
    if @items[index].nil?
      llist = LinkedList.new
      @items[index] = llist
    end
    @items[index].add_to_tail(Node.new(key, value))
    @item_count += 1
    if load_factor >= @max_load_factor
      self.resize
    end
  end

  #unlike previous lesson, you must look through list for the key
  def [](key)
    index =  self.index(key, @items.length)
    if !@items[index].nil?
      current = @items[index].head
      until current.nil?
        if current.key === key
          return current.value
        else
          current = current.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / @items.length
  end

  def size
    @items.length
  end

  # Resize the hash
  #increase the amounts of buckets by two-times
  #at each bucket, when you get to a non-nil bucket, you have to loop through a linked list now
  #resize should be triggered if max load factor reached

  #consider resetting item count back to 0
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |ll|
      unless ll.nil?
        current = ll.head
        unless current.nil?
          index = self.index(current.key, @items.length)
          if @items[index].nil?
            @items[index] = LinkedList.new
            @items[index].add_to_tail(Node.new(current.key, current.value))
            if load_factor >= @max_load_factor
              self.resize
            end
            current = current.next
          else
            @items[index].add_to_tail(Node.new(current.key, current.value))
            if load_factor >= @max_load_factor
              self.resize
            end
            current = current.next
          end
        end
      end
    end
  end

  #prints state of the hash
  def status
    if @item_count === 0.0
      puts "There are no entries in this hash."
      puts "Load Factor for hash is 0."
    else
      @items.each do |ll|
        unless ll.nil?
          current = ll.head
          index = self.index(current.key, @items.length)
          until current.nil?
            puts "Entry #{current} is located at Index #{index} and has a value of " + "\"" + "#{current.value}" + "\"" + "."
            current = current.next
          end
        end
      end
      puts "Load Factor for hash is #{@item_count / @items.length}."
    end
  end

end
