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

#Bloc implementation
#def binary_search_iterative(collection, val)
  # #1
#  low, high = 0, collection.length - 1
#  # #2
#  while low <= high
#    mid = ((low + high) / 2).ceil
#    if val < collection[mid]
#      low = mid + 1
#    elsif val > collection[mid]
#      high = mid - 1
#    else
#      return mid
#    end
#  end
#  nil
#end
