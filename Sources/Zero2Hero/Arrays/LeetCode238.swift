class LeetCode238 {
    static func productExceptSelf(_ arr: [Int] = [3,2,3,4]) -> [Int] {
        var result:[Int] = Array(repeating: 1, count: arr.count)
        //Prefix Product
        for i:Int in 1..<arr.count {
            result[i] = arr[i - 1] * result[i - 1]
        }

        //Suffix Product
        var postSuffixProduct = 1
        for i:Int in stride(from: arr.count - 2, through: 0, by: -1) {
            postSuffixProduct *= arr[i + 1]
            result[i] *= postSuffixProduct
        }
        
        return result
    }
}