class Node
  attr_accessor :value, :edges, :searched, :parent

  def initialize(title)
    @value = title
    @edges = []
    @searched = false
    @parent = nil
  end

  def addEdge(neighbor)
    @edges << neighbor
    neighbor.edges << self
  end
end

#class Node
#  attr_accessor name
#  attr_accessor film_actor_hash
#end

#Kevin_Bacon = Node.new()
#film_actor_hash = {"Footloose" => [Lori_Singer, ...],
#                   "Apollo 13" => [Tom_Hanks, Bill_Paxton...],
#                 }
#Lori_Singer = Node.new()
#film_actor_hash = {""}

#class Node
#  attr_accessor data
#  attr_accessor neighbors

#  def initialize(data)
#    data = data
#    neighbors = []
