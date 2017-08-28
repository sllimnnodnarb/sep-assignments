def poorly_written_ruby(arrays)
  combined_array = arrays.flatten
  sorted_array = [combined_array.delete_at(-1)]
  (0...combined_array.length).each do |num|
    value = combined_array[num]
    i = 0
    while i < sorted_array.length
      if value <= sorted_array[i]
        sorted_array.insert(i, value)
        break
      elsif i == sorted_array.length - 1
        sorted_array << value
        break
      end
      i+=1
    end
  end
  sorted_array
end
