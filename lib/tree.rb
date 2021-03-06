class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  # Time Complexity: O(log(n)) where n is the number of nodes
  # Space Complexity: O(log(n)) where n is the number of nodes
  def add(key, value)
    @root = add_helper(@root, key, value)
    
    # newNode = TreeNode.new(key, value)
    
    # if @root.nil?
    #   @root = newNode
    #   return @root
    # end
    
    # current = @root
    
    # while true
    #   if key < current.key
    #     if current.left.nil?
    #       current.left = newNode
    #       return
    #     else
    #       current = current.left
    #     end
    #   else
    #     if current.right.nil?
    #       current.right = newNode
    #       return
    #     else
    #       current = current.right
    #     end
    #   end
    # end
  end
  
  def add_helper(current_node, key, value)
    return TreeNode.new(key, value) if current_node.nil?
    
    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    
    return current_node
  end
  
  # Time Complexity: O(log(n)) where n is the number of nodes
  # Space Complexity: O(log(n)) where n is the number of nodes
  def find(key)
    helper_find(@root, key)
  end
  
  def helper_find(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key == key
    # return nil if current_node.left.nil? && current_node.right.nil?
    
    if key < current_node.key
      helper_find(current_node.left, key)
    else
      helper_find(current_node.right, key)
    end
  end
  
  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the size of the tree/number of function calls
  def inorder
    return inorder_helper(@root, [])
  end
  
  def inorder_helper(current_node, list)
    if current_node.nil?
      return list
    end
    
    # Do inorder on left subtree
    inorder_helper(current_node.left, list)
    
    # Add the root
    list << { key: current_node.key, value: current_node.value}
    
    # Do inorder on right subtree
    inorder_helper(current_node.right, list)
    return list
  end
  
  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def preorder
    return preorder_helper(@root, [])
  end
  
  def preorder_helper(current_node, list)
    if current_node.nil?
      return list
    end
    
    # Add the root
    list << { key: current_node.key, value: current_node.value}
    
    # Do preorder on left subtree
    preorder_helper(current_node.left, list)
    
    # Do preorder on right subtree
    preorder_helper(current_node.right, list)
    return list
  end
  
  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def postorder
    return postorder_helper(@root, [])
  end
  
  def postorder_helper(current_node, list)
    if current_node.nil?
      return list
    end
    
    # Do postorder on left subtree
    postorder_helper(current_node.left, list)
    
    # Do postorder on right subtree
    postorder_helper(current_node.right, list)
    
    # Add the root
    list << { key: current_node.key, value: current_node.value}
    
    return list
  end
  
  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def height
    return height_helper(@root, 0, 1)
  end
  
  def height_helper(current_node, max, count)
    return max if current_node.nil?
    
    if count > max
      max = count
    end
    
    height_helper(current_node.left, max, count + 1)
    height_helper(current_node.right, max, count + 1)
  end
  
  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end
  
  # Time Complexity: 
  # Space Complexity: 
  def delete
    raise NotImplementedError
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
