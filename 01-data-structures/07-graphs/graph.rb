class Graph
  def initialize
    @nodes = []
    @graph = {}
    @start = nil
    @end = nil
  end

  attr_writer :nodes, :graph, :start, :end
	attr_reader :nodes, :graph, :start, :end

  def addNode(n)
    title = n.value
    @graph[title] = n
    @nodes << n
  end

  def getNode(actor)
    @graph[actor]
  end

  def setStart(actor)
    @start = @graph[actor]
  end

  def setEnd(actor)
    @end = @graph[actor]
  end
end
