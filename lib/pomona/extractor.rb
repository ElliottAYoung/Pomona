module Extractor
  def self.get_all_by_keys(tree_array = [], keys = [], values = [])
    tree_array.each do |tree_node|
      values << tree_node.node.values_at(*keys)
      Extractor.get_all_by_keys(tree_node.children, keys, values) if tree_node.children.any?
    end

    values
  end

  def self.find_node_by_id(id, tree_array)
    #TODO: Get this working without using an instance variable for target
    tree_array.each do |tree_node|
      if tree_node.id == id
        @target = tree_node
      else
        Extractor.find_node_by_id(id, tree_node.children) if tree_node.children.any?
      end
    end

    @target
  end
end
