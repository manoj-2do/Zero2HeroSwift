class LeetCode347 {
    static func topKFrequent(_ nums: [Int] = [1,1,1,2,2,2,2,3,3,3,3,3,4,4,3,4,4,4,4,4,4,5,4,4,55,4], _ k: Int = 2) -> [Int] {
        let hashMap: [Int: Int] = nums.reduce(into: [:]) { result, element in result[element, default: 0] += 1 }

        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in hashMap {
            bucket[freq].append(num)
        }

        var result: [Int] = []
        for freq in stride(from: bucket.count - 1, through: 0, by: -1) { 
            for num in bucket[freq] {
                result.append(num)
                if result.count  == k {
                    return result
                }
            }
        }

        return result
    }
}