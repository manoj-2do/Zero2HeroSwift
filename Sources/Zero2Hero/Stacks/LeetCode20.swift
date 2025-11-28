class LeetCode20 {
    static func isValidParantheses(_ s: String) -> Bool {
        var stack:[Character] = [Character]()
        for c in s {
            if c == "(" || c == "[" || c == "{" {
               stack.append(c)
            } else {
                guard !stack.isEmpty else { continue }

                let oB = stack.removeLast()
                let cB: Character = c


                if oB == "(" && cB != ")" ||  oB == "[" && cB != "]" ||  oB == "{" && cB != "}" {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}