require "pomona/exceptions"

module Pruner
  def self.remove_node_and_descendents(node, parent_node)
    if parent_node.kind_of?(Array)
      parent_node.delete_if { |n| n.id == node.id }
    else
      parent_node.children.delete_if { |n| n.id == node.id }
    end
  end
end
