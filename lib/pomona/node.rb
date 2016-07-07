require "pomona/exceptions"

class Node
  attr_reader :id, :parent_id
  attr_accessor :children, :node

  def initialize(data_hash, id, parent_id)
    @id = id
    node_data = { id: @id, children: [] }
    @node = data_hash.merge(node_data)
    @children = @node[:children]
    @parent_id = parent_id
  end
end
