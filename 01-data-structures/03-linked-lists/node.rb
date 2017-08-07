class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    @next = nil
    @data = data
  end
end
