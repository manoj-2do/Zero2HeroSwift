class LeetCode71 {
    //  example : /home/user/Documents/../Pictures
    static func simplifiedCanonicalPath(_ input: String) -> String {
        let inputArr = input.split(separator: "/")
        var stack:[String] = [String]()
        for i:Int in 0..<inputArr.count {
            switch inputArr[i] {
            case ".":
                continue
            case "..":
                if !stack.isEmpty{
                    stack.removeLast() 
                }
            default:
                stack.append(String(inputArr[i]))
                
            }
        }
        
        var resutlString = stack.isEmpty ? "/" : ""
        stack.forEach { resutlString += "/\($0)" }

        return resutlString 
    } 
}