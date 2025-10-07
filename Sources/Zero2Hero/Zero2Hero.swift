@main
struct Zero2Hero {
    static func main() -> Void {
        let tree = TreeNode(20)
        tree.left = TreeNode(21)
        tree.right = TreeNode(22)
        tree.left?.left = TreeNode(23)
        tree.left?.right = TreeNode(50)
        
        print("Inorder: \(InOrderTraversal().recursive(tree))")
        print("Postorder: \(PostOrderTraversal().stack(tree))")
        print("Preorder: \(PreOrderTraversal().stack(tree))")
    }
}