class LeetCode789 {
    //Hint -> Find next greater element
    //Given: If there is no future days -> keep answer[i] = 0
    static func nextWarmestDay(_ temperatures: [Int]) -> [Int] {
        var answer:[Int] = Array(repeating: 0, count: temperatures.count)
        var indexStack:[Int] = [Int]()
        guard temperatures.count > 1 else { return [0] }

        for i in 0..<temperatures.count {
            while !indexStack.isEmpty, temperatures[indexStack.last!] < temperatures[i] {
                let index = indexStack.removeLast()
                let nextGreaterElIndex = i
                answer[index] = nextGreaterElIndex - index

            }
            indexStack.append(i)
        }

        return answer
    }
}