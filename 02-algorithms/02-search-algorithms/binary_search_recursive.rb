class Search
  def self.binary_recursive(arr, value)
     if arr.count == 1
       arr.first == value
     else
       mid = arr.count / 2
       if value == arr[mid]
         return true
       elsif arr[mid] < value
         mid += 1
         self.binary_recursive(arr[mid..-1], value)
       else
         mid -= 1
         self.binary_recursive(arr[0..mid], value)
       end
     end
   end
end
