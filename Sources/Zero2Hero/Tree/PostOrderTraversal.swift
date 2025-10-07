class PostOrderTraversal {
    func recursive(_ root: TreeNode?) -> [Int] {
        var arr: [Int] = []
        traverse(root, &arr)
        return arr
    }

    func traverse(_ root: TreeNode?, _ result: inout [Int]) {
        guard let node = root else { return }
        traverse(node.left, &result)
        traverse(node.right, &result)
        result.append(node.val)
    }

    func stack(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var current: TreeNode? = root
        var lastVisitedNode: TreeNode?

        while current != nil || !stack.isEmpty {
            
            while let node: TreeNode = current {
                stack.append(node)
                current = node.left
            }

            guard let peekNode: TreeNode = stack.last  else { break }

            if let right: TreeNode = peekNode.right, right !== lastVisitedNode {
                current = right
            } else {
                result.append(peekNode.val)
                lastVisitedNode = stack.removeLast()
            }
        }

        return result
    }  
}