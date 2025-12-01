class LeetCode239 {
    // [1, 2, 10, 50, 90, 100]
    // 1, 2, 3  -> 3 
    // 2, 3, 10 -> 10
    // Decreasing Monotonic Stack
    // We will also keep a track of stack front so that
    // when window is moved we ensure that we are not referencing to any values 
    // that are currently not under scope/window
    static func slidingWindowMaximum(_ arr:[Int], _ k:Int) -> [Int] {
        var iStack:[Int] = [Int]()
        var result: [Int] = [Int]()
        var stackFront = 0

        for i:Int in 0..<arr.count{
            let windowStartIndex = i - k + 1    

            if stackFront < iStack.count, iStack[stackFront] < windowStartIndex {
                stackFront += 1
            }

            while iStack.count > stackFront, arr[iStack.last!] < arr[i] {
                iStack.removeLast()
            }
            iStack.append(i)

            if i + 1 >= k {
                let maxArrIndex =  iStack[stackFront]
                result.append(arr[maxArrIndex])
            }
        }

        return result
    }

    // ---------------------------
    // |   Brute Force Method    |
    // ---------------------------
    // static func slidingWindowMaximum() {
    //     let inputArr = [-1, -5, -3, -4, -6, 0, -8]
    //     let k: Int = 3
    //     var resultArr: [Int] = [Int]()
    //     for i:Int in 0..<(inputArr.count - k + 1) {
    //         var maxWindowVal: Int = inputArr[i]
    //         for j:Int in 0..<k {
    //             maxWindowVal = max(maxWindowVal, inputArr[i + j])
    //         }
    //         resultArr.append(maxWindowVal)
    //     }
    //     print(resultArr)
    // }   
}
/*
    0, 1, 2, ..., n-1
    i, i+1, i+2, i, i+1, i+2 ... i + k - 1 
    so that it never goes out of bounds
    i + k - 1 < n - 1
    i < n - k

    0, 1, 2, 3 ... n - k
    => (n - k) - (0) + 1 
    => n - k + 1
*/

