class LeetCode219 {
    static func containsNearbyDuplicate(_ nums: [Int] = [1,0,1,1], _ k: Int = 1) -> Bool {
        var hashMap: [Int: Int] = [:]
        hashMap.reserveCapacity(nums.count)

        for i:Int in 0..<nums.count {
            let currNum = nums[i]

            if hashMap[currNum] != nil, abs(i - hashMap[currNum]!) <= k{
                 return true
            }

            hashMap[currNum] = i
        }

        return false
    }
}