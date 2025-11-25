class ProductExceptSelf {
    func run(_ nums: [Int]) -> [Int] {
        var result:[Int] = Array(repeating: 1, count: nums.count)

        for i:Int in 1..<nums.count {
            result[i] = result[i - 1] * nums[i - 1]
        }

        var suffixProduct: Int = 1
        for i:Int in stride(from: nums.count - 2, through: 0, by: -1) {
            suffixProduct = suffixProduct * nums[i + 1]
            result[i] = result[i] * suffixProduct
        }

        return result
    }
}