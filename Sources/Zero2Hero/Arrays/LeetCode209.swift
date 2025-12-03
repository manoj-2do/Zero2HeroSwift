class LeetCode209 {
    static func minSizeSubArraySum(_ nums: [Int] = [2,3,1,2,4,3], _ target: Int = 7) -> Int {
        var l = 0
        var r = 0
        var result = 0
        var runningSum = 0

        while  r < nums.count {
            runningSum += nums[r]
            
            while runningSum >= target {
                let distance = r - l + 1
                result = result == 0 ? distance : min(result, distance)
                runningSum -= nums[l]
                l += 1
            }

            r += 1
        }

        return result
    }
    //  static func minSizeSubArraySum(_ nums: [Int] = [2,5,6,1,12,10], _ target: Int = 11) -> Int {
    //     var l = 0
    //     var r = 0
    //     var result = 0
    //     var runningSum = 0

    //     while l <= r {
    //         runningSum += nums[r]
            
    //         while runningSum > target {
    //             runningSum -= nums[l]
    //             l += 1
    //         }

    //         if runningSum == target {
    //             let distance = r - l + 1
    //             result = result == 0 ? distance : min(result, distance)
    //         }

    //         if r < nums.count - 1 {
    //             r += 1
    //         }

    //     }

    //     return result
    // }
}