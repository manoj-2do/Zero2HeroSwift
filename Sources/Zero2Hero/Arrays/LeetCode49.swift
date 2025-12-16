class LeetCode49 {
    static func groupAnagrams(_ strs: [String] = ["eat","tea","tan","ate","nat","bat"]) -> [[String]] {
        var result: [[Int]: [String]] = [:]

        for word in strs {
            var count: [Int] = Array(repeating: 0, count: 26)

            for char in word {
                if let asciiVal = char.asciiValue {
                    let index = Int(asciiVal - Character("a").asciiValue!)
                    count[index] += 1
                }
            }

            result[count, default: []].append(word)

        }

        return Array(result.values)
    }
}