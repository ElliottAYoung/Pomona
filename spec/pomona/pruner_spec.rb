require "spec_helper"

describe Pruner do
  let(:tree) { Tree.new }

  before do
    tree.add_node({ name: "Test" })
  end

  describe "::remove_node_and_descendents" do
    # In this instance the tree_array is the parent rather than a Node
    context "Parent Node is an Array" do
      it "should delete the proper node" do
        node = tree.find(1)
        expect(tree.data[:tree_array]).to include(node)
        Pruner.remove_node_and_descendents(tree.find(1), tree.data[:tree_array])
        expect(tree.data[:tree_array]).to_not include(node)
      end
    end

    context "Parent Node is not an Array" do
      before do
        tree.add_node({ name: "Test2" }, 1)
      end

      it "should delete the proper node" do
        node = tree.find(2)
        parent_node = tree.find(1)
        expect(parent_node.children).to include(node)

        Pruner.remove_node_and_descendents(node, parent_node)
        expect(parent_node.children).to_not include(node)
      end
    end
  end
end
