class Node
  attr_reader :id
  attr_accessor :children, :node

  def initialize(data_hash, id)
    @id = id
    node_data = { id: @id, children: [] }
    @node = data_hash.merge(node_data)
    @children = @node[:children]
  end
end
