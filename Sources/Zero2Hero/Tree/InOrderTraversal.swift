class InOrderTraversal {
    /// - Parameter root: TreeNode (Optional)
    /// - Returns: [Int]
    /// - Time Complexity: O(n)
    func recursive(_ root: TreeNode?) -> [Int] {
        var arr: [Int] = []
        traverse(root, &arr)
        return arr
    }

    func traverse(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else { return }
        traverse(node.left, &result)
        result.append(node.val)
        traverse(node.right, &result)
    }

    func stack(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var current = root

        while current != nil || !stack.isEmpty {

            while let node = current {
                stack.append(node)
                current = node.left
            }

            let node = stack.removeLast()
            result.append(node.val)

            current = node.right
        }

        return result
    }
}