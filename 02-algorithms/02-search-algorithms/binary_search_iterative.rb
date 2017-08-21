class Search
  def self.binary_iterative(arr, value)
    start = 0
    stop = arr.length - 1

    until start == stop
      mid = arr.length / 2 + start
      if value == arr[mid]
        return true
      elsif arr[mid] < value
        start = mid + 1
      else
        stop = mid - 1
      end
    end
    value == arr[start]
  end
end
