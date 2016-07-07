class NodeNotFound < ArgumentError
  def initialize(msg="The ID for a Node you have provided does not exist")
    super
  end
end
