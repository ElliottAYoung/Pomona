require "spec_helper"

describe Tree do
  let(:tree) { Tree.new }

  describe "readable attributes" do
    describe "data" do
      it "should be a hash" do
        expect(tree.data).to be_a_kind_of(Hash)
      end
    end
  end

  describe "#add_node" do
    it 'should create a new Node' do
      node = tree.add_node({ name: "Test Node" })[0]
      expect(tree.data[:tree_array][0]).to be_a_kind_of(Node)
    end

    it 'should append the node to the Tree' do
      node = tree.add_node({ name: "Test Node" })[0]
      expect(tree.data[:tree_array][0]).to eq(node)
    end

    describe "#attach_to_parent" do
      before do
        tree.add_node({ name: "Alpha Node" })
      end

      context 'parent_id is nil' do
        it 'should append the node to data[:tree_array]' do
          node = tree.add_node({ name: "Test Node" })[0]
          expect(tree.data[:tree_array]).to include(node)
        end
      end

      context 'parent_id is not nil' do
        it 'should append the node to the parent_nodes children array' do
          node = tree.add_node({ name: "Test Node" }, 1)[0]
          expect(tree.find(1).children).to include(node)
        end
      end
    end

    describe "#next_id" do
      it 'should return an Integer' do
        node = tree.add_node({ name: "Alpha Node" })[0]
        expect(node.id).to be_a_kind_of(Integer)
      end

      it 'should return "1" for the first added node to a tree' do
        node = tree.add_node({ name: "Alpha Node" })[0]
        expect(node.id).to eq(1)
      end
    end
  end

  describe "#remove_node" do
    xit 'should delete the selected Node' do
    end

    xit 'should delete any descendents of the selected Node' do
    end

    context 'node.parent_id is nil' do
      xit 'should delete the selected node from data[:tree_array]' do
      end
    end

    context 'node.parent_id is not nil' do
      xit 'should delete the node from the parents children array' do
      end
    end
  end

  describe "#values_at" do
    xit "should return an Array" do
    end

    context 'Multiple Keys were given' do
      xit 'should be a nested array' do
      end
    end

    context 'Single Key was given' do
      xit 'should not be a nested array' do
      end
    end
  end

  describe "#find" do
    before do
      tree.add_node({ name: "Test" })
    end

    context 'ID exists' do
      it 'should return a Node Object' do
        expect(tree.find(1)).to be_a_kind_of(Node)
      end
    end

    context 'ID does not exist' do
      xit 'should return raise an Exception' do
      end
    end
  end
end
