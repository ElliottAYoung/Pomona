require 'spec_helper'

describe Node do
  let(:tree) { Tree.new }

  before do
    tree.add_node({ name: "Test" })
  end

  let(:node_obj) { tree.find(1) }

  describe "Accessible Attributes" do
    describe "children" do
      it 'should be writeable' do
        node_obj.children << "Test String"
        expect(node_obj.children).to include("Test String")
      end

      it 'should return an Array' do
        expect(node_obj.children).to be_a_kind_of(Array)
      end
    end

    describe "node" do
      it 'should be writeable' do
        node_obj.node[:test_key] = "Test String"
        expect(node_obj.node[:test_key]).to eq("Test String")
      end

      it 'should return a Hash' do
        expect(node_obj.node).to be_a_kind_of(Hash)
      end
    end
  end

  describe "Readable Attributes" do
    describe "id" do
      it "should be an integer" do
        expect(node_obj.id).to be_a_kind_of(Integer)
      end
    end

    describe "parent_id" do
      context 'Top Level Node' do
        it "should be nil" do
          expect(node_obj.parent_id).to be_nil
        end
      end

      context 'Child Node' do
        before do
          tree.add_node({ data: "Test String" }, 1)
        end

        let(:child_node_obj) { tree.find(2) }

        it "should be an integer" do
          expect(child_node_obj.parent_id).to be_a_kind_of(Integer)
        end
      end
    end
  end
end
