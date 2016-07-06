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
end
