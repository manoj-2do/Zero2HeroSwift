class PreOrderTraversal {
    func recursive(_ root: TreeNode?) -> [Int] {
        var arr: [Int] = []
        traverse(root, &arr)
        return arr
    }
    
    func traverse(_ root: TreeNode?, _ result: inout [Int]) {
        guard let node: TreeNode = root  else { return }
        result.append(node.val)
        traverse(node.left, &result)
        traverse(node.right, &result)
    }

    func stack(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var current: TreeNode? = root

        while (current != nil || !stack.isEmpty) {
           while let node = current {
                result.append(node.val)
                stack.append(node)
                current = node.left
           }

           let node = stack.removeLast()
           current = node.right
        }

        return result
    }
}