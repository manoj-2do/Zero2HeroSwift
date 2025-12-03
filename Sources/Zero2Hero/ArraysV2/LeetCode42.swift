class LeetCode42 {
    /*
        Given: 
            1. Height of each bar is given in an array
            2. Width of each bar is 1
    */
    static func trapRainWater(_ height: [Int] = [4,2,0,3,2,5]) -> Int {
        var maxParts = 0
        var leftMax = 0
        var rightMax = 0
        var l = 0
        var r = height.count - 1
        
        while (l <= r){
            if height[l] <= height[r] {
                if leftMax > height[l] {
                    maxParts += leftMax - height[l]
                } else {
                    leftMax = height[l]
                }
                l += 1
            } else {
                if rightMax > height[r] {
                    maxParts += rightMax - height[r]
                } else {
                    rightMax = height[r]
                }
                r -= 1
            }
        }
        return maxParts
    }
}