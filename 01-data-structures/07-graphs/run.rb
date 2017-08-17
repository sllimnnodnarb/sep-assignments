require 'json'
require_relative 'node.rb'
require_relative 'graph.rb'

data = File.read('kevinbacon.json')
data_hash = JSON.parse(data)

graph = Graph.new

@matches = []
movies = data_hash['movies']


movies.count.times do |i|
  @movie = movies[i]['title']
  @cast = movies[i]['cast']

  movieNode = Node.new(@movie)
  graph.addNode(movieNode)

  @cast.count.times do |j|
    @actor = @cast[j]
    @actorNode = graph.getNode(@actor)

    if @actorNode.nil?
      @actorNode = Node.new(@actor)
    end

    if (@cast.include? "Kevin Bacon") && (@cast.include? "Julia Roberts")
      @matches << @movie
    end

    graph.addNode(@actorNode)
    movieNode.addEdge(@actorNode)
  end
end

puts "\e[3m	Enter a name to search for: \e[0m"
@startName = gets.chomp
@startNode = graph.setStart(@startName)

while @startNode.nil?
	puts "\e[3m	Name doesn't appear in database. Try again\e[0m"
	@startName = gets.chomp
	@startNode = graph.setStart(@startName)
end

endNode = graph.setEnd("Kevin Bacon")

queue = []

@startNode.searched = true
queue << @startNode

while queue.count > 0
  current = queue.shift

  if current == endNode
    break
  else
    edges = current.edges

    edges.each do |e|
      if e.searched == false
      e.searched = true
        e.parent = current
        queue << e
      end

      if e.searched == false
        e.searched = true
        e.movie = movie
        queue << movie
      end
    end
  end
end

path = []
path << endNode
nxt = endNode.parent
while nxt != nil
  path << nxt
  nxt = nxt.parent
end

txt = ''
path.reverse_each do |r|
  txt << r.value
  txt << ' --> '
end
txt = txt[0..-6]
puts txt
puts @matches
