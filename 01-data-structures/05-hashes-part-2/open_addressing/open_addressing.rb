require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    index = self.index(key, @items.length)
    if @items[index].nil?
      @items[index] = Node.new(key, value)
      @item_count += 1
    elsif @items[index].key === key
      if @items[index].value != value
        @items[index].value = value
        if self.next_open_index(0) === -1
          self.resize
        end
      end
    else
      index = self.next_open_index(index)
      if index === -1
        self.resize
        self[key] = value
        @item_count += 1
      elsif @items[index].nil?
        @items[index] = Node.new(key, value)
        @item_count += 1
      elsif @items[index].key === key && @items[index].value != value
        @items[index].value = value
      end
    end
  end

  def [](key)
    index = self.index(key, @items.length)
    until index === @items.length
      if @items[index].nil?
        index += 1
      elsif @items[index].key === key
        return @items[index].value
      else
        index += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
      key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until index > @items.length
      if index === @items.length
        index = -1
        break
      elsif @items[index].nil?
        break
      else
        index += 1
      end
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    @items = Array.new(old_array.length * 2)
    old_array.each do |pair|
      unless pair.nil?
        index = self.index(pair.key, @items.length)
        if @items[index].nil?
          @items[index] = Node.new(pair.key, pair.value)
        elsif @items[index].key != pair.key
          index = self.next_open_index(index)
          if index === -1
            self.resize
            self[pair.key] = pair.value
          else
            @items[index] = Node.new(pair.key, pair.value)
          end
        elsif @items[index].key === pair.key && @items[index].value != pair.value
          @items[index].value = pair.value
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
      @items.each do |pair|
        unless pair.nil?
          index = self.index(pair.key, @items.length)
          puts "Entry #{pair} is located at Index #{index} and has a value of " + "\"" + "#{pair.value}" + "\"" + "."
        end
      end
      puts "Load Factor for hash is #{@item_count / @items.length}."
    end
  end

end
