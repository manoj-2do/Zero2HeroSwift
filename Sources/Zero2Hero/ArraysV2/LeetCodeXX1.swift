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
}