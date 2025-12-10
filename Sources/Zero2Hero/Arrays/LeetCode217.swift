class LeetCode217 {
    /* 
        Optimized Solution
        nums.count != Set(nums).count
    */

    static func containsDuplicate(_ nums: [Int] = [1,2,3,4]) -> Bool {
        var hashMap: Set = Set<Int>()

        for num in nums {
            if hashMap.contains(num) {
                return true
            }
            hashMap.insert(num)
        }

        return false
    }
}