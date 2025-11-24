class SimplifyPath {
    init(){}

    func run(_ path: String) -> String {
        var stack: [String] = [String]()
        let inputPathArr = path.split(separator: "/")

        for i:Int in 0..<inputPathArr.count {
            switch inputPathArr[i] {
            case ".":
                continue
            case "..":
                if !stack.isEmpty {
                    stack.removeLast()
                }
            default:
                stack.append(String(inputPathArr[i]))
            }
        }
        
        var resultStr: String = ""
        stack.forEach { str in
            resultStr.append("/\(str)")
        }
        
        return resultStr.isEmpty ? "/" : resultStr
    }
}