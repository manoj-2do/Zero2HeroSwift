import DequeModule

class WindowSum {
    static func maxSum(_ arr: [Int], k: Int) -> Int {
        if arr.isEmpty { return 0 }

        var maxSum = 0

        for i: Int in 0..<(arr.count - k + 1) {
            var currSum: Int = 0
            //run window loop
            for j: Int in 0..<k {
                currSum += arr[i + j]
            }

            maxSum = max(currSum, maxSum)
        }

        return maxSum
    }

    static func decreasingMonotonicQueue(_ arr: [Int]) -> [Int] {
        var q: [Int] = []

        for i:Int in 0..<arr.count {
            //For Increasing -> q.last < currELement if no then pop till last value of queue is smaller than the curr element
            while !q.isEmpty && q[q.count - 1] < arr[i] {
               _ = q.popLast()
            } 
            q.append(arr[i])
        }

        return q
    }

    static func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var q: [Int] = []
        var l: Int = 0
        var output: [Int] = []

        for r:Int in 0..<nums.count {
            while(!q.isEmpty && nums[q[q.count - 1]] < nums[r]) {
                _ = q.popLast()
            }
            q.append(r)

            if l > q[0] {
                q.removeFirst()
            } 

            if r+1 >= k {
                output.append(nums[q[0]])
                l += 1
            }
        }

        return output
    }

    //Time Complexity: O(n)
    static func optimizedSlidingWindowMax(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0, !nums.isEmpty else { return [] }
        if k == 1 { return nums }
        var q: [Int] = [Int]()
        var dequeFront: Int = 0
        var windowMaxValue = [Int]()
        windowMaxValue.reserveCapacity(max(0, nums.count - k + 1))


        for currIndex in 0..<nums.count {
            let windowStartIndex = currIndex - k + 1

            while dequeFront < q.count, q[dequeFront] < windowStartIndex {
                dequeFront += 1
            }

            while q.count > dequeFront, nums[q[q.count - 1]] <= nums[currIndex] {
                q.removeLast()
            } 

            q.append(currIndex)

            if currIndex + 1 >= k {
                let maxIndexForWindow = q[dequeFront]
                windowMaxValue.append(nums[maxIndexForWindow])
            }
        }

        return windowMaxValue
    }
}