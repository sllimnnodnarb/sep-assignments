require 'benchmark'

def closest(graph_of_cities, current_city, array)
  graph_of_cities[current_city][-1] = true
  distance = 1000
  index = nil


while array.length < graph_of_cities.length - 1
  graph_of_cities[current_city][0...-1].each_with_index do |num, idx|
    if num < distance && num > 0 && graph_of_cities.values[idx][-1] != true
      distance = num
      index = idx
    end
  end
  array << graph_of_cities.keys[index]
  closest(graph_of_cities, graph_of_cities.keys[index], array)
  end
  array
end

#cities = San Antonio, Dallas, Seattle, visited?
#index[0] miles to San Antonio, index[1] miles to Dallas, etc.
cities = { :san_antonio => [0, 250, 200, false], :dallas => [250, 150, 150, false], :seattle => [500, 350, 250, false] }

# puts nearest_possible_neighbor(map, :irvine, [])
bingo = Benchmark.measure do |x|
  puts closest(cities, :dallas, [])
end

puts bingo
