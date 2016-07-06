require "pomona/node"
require "pomona/extractor"
require "pomona/pruner"

class Tree
  attr_reader :data

  def initialize
    @data = { tree_array: [] }
  end

  def add_node(node_hash, parent_id = nil)
    #Creates a new node to be attached to a parent
    #Grants a generated id to the node
    node = Node.new(node_hash, next_id)
    attach_to_parent(node, parent_id)
  end

  def remove_node(id)
    #Removes a node from the Tree by its id
    #Removes all of their descendents as well
    node_to_delete = @data.find(id)
    Pruner.remove_node_and_descendents(node_to_delete)
  end

  def values_at(keys)
    #Returns an array of data from the tree based on the given keys
    data = Extractor.get_all_by_keys(@data[:tree_array], keys)
    flatten_output_array(data)
  end

  def find(id)
    #Finds and returns a Node by its id using the Extractor
    Extractor.find_node_by_id(id)
  end

  private

  def next_id
    #Finds the next highest id to put a node in at
    ids = values_at(:id).sort
    ids[-1].nil? ? 1 : (ids[-1] + 1)
  end

  def attach_to_parent(node, parent_id)
    #Attaches the newly created node to a parent node
    #If parent_id is nil will simply attach it to the top level
    if parent_id.nil?
      @data[:tree_array] << node
    else
      parent = @data.find(parent_id)
      parent.children << node
    end
  end

  def flatten_output_array(output_array)
    #Flattens the output array of values_at if it only contains data for one key
    return output_array if output_array.empty?
    output_array[0].length == 1 ? output_array.flatten : output_array
  end
end