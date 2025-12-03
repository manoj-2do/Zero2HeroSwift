class LeetCode316 {
    static func removeDuplicateLetters(_ s: String = "cbacdcbc") -> String {
        var resultStack: [Character] = [Character]()
        var lastSeen = Set(resultStack)
        var lastIndexMap: [Character: Int] = [:]
        s.enumerated().forEach { lastIndexMap[$0.1] = $0.0 } 

        for (i,c) in s.enumerated() where !lastSeen.contains(c) {

            while let top = resultStack.last, c < top, lastIndexMap[top]! > i {
                resultStack.removeLast()
                lastSeen.remove(top)
            }

            resultStack.append(c)
            lastSeen.insert(c)
        }
        return String(resultStack)
    }
}
