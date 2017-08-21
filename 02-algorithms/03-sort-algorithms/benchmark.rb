require 'benchmark'
require_relative 'bucket'
require_relative 'heap'
require_relative 'quick_sort'

Benchmark.bm do |x|
  arr = [1,9,2,8,3,7,4,6,10,11,19,12,18,13,17,14,16,20,21,29,22,28,23,27,24,26,30, 31,39,32,38,33,37,34,36,40, 41,49,42,48,43,47,44,46,50]
  buckets = 5
  x.report { QuickSort.sort(arr) }
  x.report { HeapSort.sort(arr) }
  x.report { BucketSort.sort(arr, buckets)  }
end
