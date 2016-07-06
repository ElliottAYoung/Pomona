module Extractor
  def self.get_all_by_keys(tree_array = [], keys = [], values = [])
    tree_array.each do |tree_node|
      values << tree_node.node.values_at(*keys)
      if tree_node.children.any?
        Extractor.get_all_by_keys(tree_node.children, keys, values)
      end
    end

    values
  end

  def self.find_node_by_id(id, tree_array = [])
    tree_array.each do |tree_node|
      if tree_node.id == id
        return tree_node
      else
        if tree_node.children.any?
          Extractor.find_node_by_id(id, tree_array)
        end
      end
    end
  end
end
