class PrefixSum {
    func run(_ nums: [Int]) -> [Int] {
        var resultArr:[Int] = Array(repeating: 0, count: nums.count)
        var runningSum = 0

        for i in 0..<nums.count {
            runningSum += nums[i]
            resultArr[i] = runningSum
        }

        return resultArr
    }

    /*  
        var arr = [1,2,4]
        PrefixSum().inplace(&arr)
        Output = [1, 3, 7]
    */
    func inplace(_ nums: inout [Int]) -> [Int] {
        var runningSum = 0
        for i in 0..<nums.count {
            runningSum += nums[i]
            nums[i] = runningSum
        }

        return nums
    }
}

