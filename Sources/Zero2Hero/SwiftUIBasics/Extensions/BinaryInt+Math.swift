//Binary integer is to represent all Integer data types in Swift
extension BinaryInteger {
    func clamp(low: Self, high: Self) -> Self {
        if self > high {
            return high
        } else if self < low {
            return low
        } else {
            return self
        }
    }
}