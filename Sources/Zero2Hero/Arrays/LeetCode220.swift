class LeetCode220 {
    // static func containsNearbyAlmostDuplicate(_ nums: [Int] = [1,5,9,1,5,9], _ indexDiff: Int = 2, _ valueDiff: Int = 3) -> Bool {
    //     if nums.count < 1 || valueDiff < 0 { return false }
    //     for l in 0..<nums.count {
    //         var r = l + 1
    //         while r < nums.count, r - l <= indexDiff {
    //             if abs(nums[r] - nums[l]) <= valueDiff {
    //                 return true
    //             }

    //             r += 1
    //         }
    //     }
    //     return false       
    // }

    //Brute Force
    // static func containsNearbyAlmostDuplicate(_ nums: [Int] = [1,5,9,1,5,9], _ indexDiff: Int = 2, _ valueDiff: Int = 3) -> Bool {
    //     if nums.count < 1 { return false }

    //     for l in 0..<nums.count {
    //         var r = l + 1
    //         while r < nums.count, r - l <= indexDiff {
    //             if abs(nums[r] - nums[l]) <= valueDiff {
    //                 return true
    //             }

    //             r += 1
    //         }
    //     }
    //     return false       
    // }
}