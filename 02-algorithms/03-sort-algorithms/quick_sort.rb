class QuickSort

  def self.sort(arr)
    if arr.length <= 1
      return arr
    else
      pivot = (arr.length / 2).to_i
      pivot_val = arr[pivot]
      arr.delete_at(pivot)
      smaller = Array.new
      greater = Array.new
      arr.each do |val|
        if val <= pivot_val
          smaller << val
        else
          greater << val
        end
      end
      return  self.sort(smaller) + [pivot_val] + self.sort(greater)
    end
  end

end
