class LeetCode11 {
    static func containerWithMostWater(_ height: [Int] = [1,8,6,2,5,4,8,3,7]) -> Int {
        var maxWater = 0
        var l: Int = 0
        var r = height.count - 1

        while l < r {
            let distance = r - l
            maxWater = max(maxWater ,(min(height[l], height[r]) * distance))

            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }

        return maxWater
    }
}
