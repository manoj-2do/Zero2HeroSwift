extension Int {
    mutating func plusOne() {
        self += 1
    }
    
    //Note: Will work with only Int and not UInt or any other Int data types
    func clamp(low: Int, high: Int) -> Int {
        if self > high {
            return high
        } else if self < low {
            return low
        } else {
            return self
        } 
    }
}

