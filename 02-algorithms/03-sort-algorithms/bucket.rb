class BucketSort
  require_relative 'insertion_sort'

  def self.sort(array, bucket_size)
    bucket_count = ((array.max - array.min) / bucket_size).floor + 1

    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    (0..array.length - 1).each do |i|
      buckets[((array[i] - array.min) / bucket_size).floor].push(array[i])
    end

    array.clear
    (0..buckets.length - 1).each do |i|
      InsertionSort.sort buckets[i]
      buckets[i].each do |value|
        array.push(value)
      end
    end
  end

end
