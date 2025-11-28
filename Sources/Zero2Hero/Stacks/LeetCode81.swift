class LeetCode81 {
    //Given: Width of each bar -> 1 
    static func largestRectangleHistogram(_ heights: [Int]) -> Int {
        var maxArea: Int = 0
        var indexedStack:[Int] = [Int]()
        indexedStack.reserveCapacity(heights.count)

        for i: Int in 0..<heights.count {
            while !indexedStack.isEmpty, heights[indexedStack.last!] > heights[i] {
                let currElementHeight = heights[indexedStack.removeLast()]
                let nextSmallestElIndex = i
                let previousSmallestElIndex = !indexedStack.isEmpty ? indexedStack.last! : -1


                let currArea = currElementHeight * (nextSmallestElIndex - previousSmallestElIndex - 1)
                maxArea = max(maxArea, currArea)
            }
            indexedStack.append(i)
        }

        return maxArea
    }
}



