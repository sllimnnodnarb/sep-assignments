require 'benchmark'
require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'

n = 50000
Benchmark.bm do |x|
  arr = [1..100]
  value = 78
  x.report { Search.binary_iterative(arr, value)  }
  x.report { Search.binary_recursive(arr, value) }
end
