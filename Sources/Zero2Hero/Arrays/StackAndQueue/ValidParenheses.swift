class ValidParantheses {
    func run(_ s: String) -> Bool {
        let inputStrArr = s.split(separator: "")
        var stack:[String] = [String]()

        for i:Int in 0..<inputStrArr.count {
            let el = String(inputStrArr[i])

            if el == "(" || el == "{" || el == "[" {
                stack.append(el)
                continue
            }

            guard !stack.isEmpty else { return false }

            let last = stack.removeLast()
            if (last == "(" && el != ")") || (last == "{" && el != "}") || (last == "[" && el != "]") {
                return false
            }

        }
        return stack.isEmpty
    }

    func longestValid(_ s: String) -> Int {
        var stack:[Int] = [Int]()
        var maxSubStrLen = 0
        for (i,c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                _ = stack.popLast()
                if stack.isEmpty {
                    stack.append(i) //Mark last invalid parantheses
                } else {
                    maxSubStrLen = max(maxSubStrLen, i - stack[stack.count - 1])
                }

            }

        }
        return maxSubStrLen
    }
}