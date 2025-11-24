//Very Important
class MinStack {
    var stack:[Int] = [Int]()
    var min = 0

    func push(_ val: Int) {
        if stack.isEmpty {
            min = val
        } else {
            if (val <= min) {
                stack.append(min)
                min = val
            }
        }
        stack.append(val)

        /*
            min = -2, val = -3
            stack = [-2, -2, -3]  
            Note: New Min has previous min just before it
        */
    }

    func pop() {
        if stack.isEmpty { return }

        let top = stack.removeLast()
        if !stack.isEmpty, top == min {
            min = stack.removeLast()
        }
    }
    
    func top() -> Int {
        guard !stack.isEmpty else { return 0 }
        return stack[stack.count - 1]
    }
    
    func getMin() -> Int {
        return min
    }
}