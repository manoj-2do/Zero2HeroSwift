class LeetCode128 {
  static func longestConsecutive(_ nums: [Int] = [0,0,-1]) -> Int {
    let numsSet = Set(nums)
    var maxLen = 0
    
    for num in numsSet {
            if !numsSet.contains(num - 1) {
                var current = num
                var length = 1
                
                while numsSet.contains(current + 1) {
                    current += 1
                    length += 1
                }
                
                maxLen = max(maxLen, length)
            }
    }

    return maxLen
  }
}