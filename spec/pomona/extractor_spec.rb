require 'spec_helper'

describe Extractor do
  let(:tree) { Tree.new }

  before do
    tree.add_node({ name: "One" })
  end

  describe "::get_all_by_keys" do

    context 'Flat Tree' do
      it 'should return an Array' do
        expect(Extractor.get_all_by_keys(tree.data[:tree_array], :id)).to be_a_kind_of(Array)
      end
    end

    context 'Two Level Tree' do
      before do
        tree.add_node({ name: "Two" }, 1)
      end

      it 'should return an Array' do
        expect(Extractor.get_all_by_keys(tree.data[:tree_array], :id)).to be_a_kind_of(Array)
      end
    end

    context 'Three+ Level Tree' do
      before do
        tree.add_node({ name: "Two" }, 1)
        tree.add_node({ name: "Three" }, 2)
        tree.add_node({ name: "Four" }, 3)
      end

      it 'should return an Array' do
        expect(Extractor.get_all_by_keys(tree.data[:tree_array], :id)).to be_a_kind_of(Array)
      end
    end
  end

  describe "::find_node_by_id" do
    context 'ID Does Not Exist' do
    end

    context 'ID Does Exist' do
      context 'Flat Tree' do
        it 'should return a Node Object' do
          expect(Extractor.find_node_by_id(1, tree.data[:tree_array])).to be_a_kind_of(Node)
        end
      end

      context 'Two Level Tree' do
        before do
          tree.add_node({ name: "Two" }, 1)
        end

        it 'should return a Node Object' do
          expect(Extractor.find_node_by_id(2, tree.data[:tree_array])).to be_a_kind_of(Node)
        end
      end

      context 'Three+ Level Tree' do
        before do
          tree.add_node({ name: "Two" }, 1)
          tree.add_node({ name: "Three" }, 2)
          tree.add_node({ name: "Four" }, 3)
        end

        it 'should return a Node Object' do
          expect(Extractor.find_node_by_id(4, tree.data[:tree_array])).to be_a_kind_of(Node)
        end
      end
    end
  end
end
