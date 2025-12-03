class LeetCodeXX1 {
    static func slidingWindowSum(_ arr:[Int], _ k: Int) -> [Int] {
        var resultArr:[Int] = [Int]()
        var windowSum = 0

        for i:Int in 0..<arr.count {
            windowSum += arr[i]
            if i >= k - 1 {
                resultArr.append(windowSum)
                windowSum -= arr[i - k + 1] 
            }
        }

        return resultArr
    }

    static func prefixSum(_ arr:[Int] = [1,4,5,6,7]) -> [Int] {
        var result:[Int] = Array(repeating: 0, count: arr.count)
        var running = 0

        for i:Int in 0..<arr.count {
            running += arr[i]
            result[i] = running
        }

        return result
    }
}