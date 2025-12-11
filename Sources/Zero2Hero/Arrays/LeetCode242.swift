class LeetCode242 {
    static func isAnagram(_ s: String = "ab", _ t: String = "a") -> Bool {
        var freq: [Character: Int] = [:]
        
        for char in s {
            freq[char, default: 0] += 1
        }

        for char in t {
            freq[char, default: 0] -= 1
        }

        for count in freq.values {
            if count != 0 { return false }
        }

        return true
    }
}