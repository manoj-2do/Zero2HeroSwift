class LeetCode1 {
    static func twoSum(_ nums: [Int] = [3,3], _ target: Int = 6) -> [Int] {
        var hashMap: [Int: Int] = [:]
        for (i,num) in nums.enumerated() {
            if let j = hashMap[target - num] {
                return [j , i]
            }
            hashMap[num] = i
        }

        return []
    }
}