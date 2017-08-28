def sorting_hash(hash, array)
  arr = array
  largest = 0
  index = 0
  until hash.length == 0
    hash.each do |k,v|
      if v > largest
        largest = v
        index = k
      end
    end
    arr.unshift(largest)
    hash.delete(index)
    sorting_hash(hash, arr)
  end
  arr
end
