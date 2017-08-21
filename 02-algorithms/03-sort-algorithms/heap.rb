class HeapSort

  def self.sort(array)
    heap(array)
    end_point = array.length - 1
    while end_point > 0
      array[end_point], array[0] = array[0], array[end_point]
      end_point -= 1
      shift_down(array, 0, end_point)
    end
    return array
  end

  def self.heap(array)
    start_point = (array.length - 2) / 2
    while start_point >= 0
      shift_down(array, start_point, array.length - 1)
      start_point -= 1
    end
    self
  end

  def self.shift_down(array, start_point, end_point)
    root = start_point
    while root * 2 + 1 <= end_point
      child = root * 2 + 1
      swap = root
      if array[swap] < array[child]
        swap = child
      end
      if child + 1 <= end_point && array[swap] < array[child + 1]
        swap = child + 1
      end
      if swap != root
        array[root], array[swap] = array[swap], array[root]
        root = swap
      else
        return
      end
    end
  end

end
