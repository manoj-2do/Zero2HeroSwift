class Monotonic {
    //Hint: Montonoic Decreasing Queue
    static func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0, !nums.isEmpty else { return [] }
        if k == 1 { return nums }
        var q: [Int] = [Int]()
        var dequeFront: Int = 0
        var windowMaxValue = [Int]()
        windowMaxValue.reserveCapacity(max(0, nums.count - k + 1))


        for currIndex in 0..<nums.count {
            let windowStartIndex = currIndex - k + 1

            while dequeFront < q.count, q[dequeFront] < windowStartIndex {
                dequeFront += 1
            }

            while q.count > dequeFront, nums[q[q.count - 1]] <= nums[currIndex] {
                q.removeLast()
            } 

            q.append(currIndex)

            if currIndex + 1 >= k {
                let maxIndexForWindow = q[dequeFront]
                windowMaxValue.append(nums[maxIndexForWindow])
            }
        }

        return windowMaxValue
    }

    static func dailyTemperatures(_ temparatures: [Int]) -> [Int] {
        guard !temparatures.isEmpty else { return [] }
        if temparatures.count == 0 { return [] }
        var stack: [Int] = [Int]()
        var result: [Int] = Array(repeating: 0, count: temparatures.count)

        for i:Int in 0..<temparatures.count {
            while !stack.isEmpty, temparatures[stack[stack.count-1]] < temparatures[i] {
                let index: Int = stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }

        return result
    }

    //Brute Force
    static func largestRectangleHistogram(_ heights: [Int]) -> Int {
        var maxArea = 0
        for i:Int in 0..<heights.count {
            var minHeight: Int = heights[i]
            for j:Int in i..<heights.count {
                minHeight = min(minHeight, heights[j])
                let area = minHeight * (j - i + 1)
                maxArea = max(area, maxArea)
            }
        }

        return maxArea
    }

    static func optimizedLargestRectangelHistogram(_ heights: [Int]) -> Int {
        var indexStack: [Int] = [Int]()
        var maxArea: Int = 0

        for i:Int in 0..<heights.count {
            while !indexStack.isEmpty, heights[indexStack[indexStack.count - 1]] > heights[i] {
                let elIndex: Int = indexStack.removeLast()
                let previousSmallestIndex = indexStack.isEmpty ? -1 : indexStack.last!
                let nextSmallestIndex = i
                
                maxArea = max(maxArea, heights[elIndex] * (nextSmallestIndex - previousSmallestIndex - 1))
            }
            indexStack.append(i)
        }
        
        while !indexStack.isEmpty {
            let elIndex = indexStack.removeLast()
            let nextSmallestIndex = heights.count
            let previousSmallestIndex = indexStack.isEmpty ? -1 : indexStack.last!
            
            maxArea = max(maxArea, heights[elIndex] * (nextSmallestIndex - previousSmallestIndex - 1))
        }

        return maxArea
    }

    static func trapRainWater(_ height: [Int]) -> Int {
        var totalWater = 0
        for i:Int in 0..<height.count {
            var leftMax = 0
            var rightMax: Int = 0

            for left:Int in 0..<i {
                if height[i] < height[left] {
                    leftMax = max(leftMax, height[left])
                }
            }

            for right: Int in i+1..<height.count {
                if height[i] < height[right] {
                    rightMax = max(rightMax, height[right])
                }
            }

            if(leftMax == 0 || rightMax == 0) {
                continue
            }

            let waterLevel = min(leftMax, rightMax) - height[i]
            totalWater += waterLevel
        }

        return totalWater
    }

    static func optimziedTrapRainWater(_ height: [Int]) -> Int {
      /* Traversing from Left or Right will allow me to find out the max Height of that side 
      and formula to find out how much water can be stored between two building is
      
      min(leftMax, rightMax) - currEl (Given currEl is greater than min(leftMax, rightMax))
      */
        var totalParts = 0
        var leftMax = 0
        var rightMax = 0
        var l = 0
        var r = height.count - 1

        while (l < r) {
            //left
            if height[l] <= height[r] {
                if leftMax > height[l] {
                    totalParts += leftMax - height[l]
                } else {
                    leftMax = height[l]
                }
                l += 1
            } else {
            //right
                if rightMax > height[r] {
                    totalParts += rightMax - height[r]
                } else {
                    rightMax = height[r]
                }
                r -= 1
            }
        }

        return totalParts

    }

    static func removeDuplicateLetters(_ s: String) -> String {
        var resultStack: [Character] = [Character]()
        var lastIndexMap: [Int: Int] = [:]
        var lastSeenMap: [Int: Bool] = [:] 

        //Last Index of Every Character
        for (i, c) in s.enumerated() {
            lastIndexMap[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] = i    
        }

        for (i, c) in s.enumerated() {
            //If It is already visited then skip this iteration
            if lastSeenMap[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] ?? false { continue }

            //Increasing Monotonic Stack will result in smallest in Lexicographical order
            while !resultStack.isEmpty, resultStack.last! > c, lastIndexMap[Int(resultStack.last!.asciiValue!) - Int(Character("a").asciiValue!)]! > i  {
                lastSeenMap[Int(resultStack.last!.asciiValue!) - Int(Character("a").asciiValue!)] = false
                resultStack.removeLast()
            }

            resultStack.append(c)
            lastSeenMap[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] = true
        }
        
        return String(resultStack)
    }

    static func removeDuplicateLettersV2(_ s: String) -> String {
        var resultStack: [Character] = [Character]()
        var lastSeen = Set(resultStack)
        let lastIndexMap = Dictionary(zip(s, 0...)) {$1}

        for (i, c) in s.enumerated() where !lastSeen.contains(c) {
            //Increasing Monotonic Stack will result in smallest in Lexicographical order
            while let top = resultStack.last, c < top, lastIndexMap[top]! > i   {
                resultStack.removeLast()
                lastSeen.remove(top)
            }

            resultStack.append(c)
            lastSeen.insert(c)
        }
        
        return String(resultStack)
    }

    static func evalRPN(_ tokens: [String]) -> Int {
        var stack:[Int] = [Int]()

        for i:Int in 0..<tokens.count {
            switch tokens[i] {
                case "+":
                    let operand1: Int = stack.removeLast()
                    let operand2: Int = stack.removeLast()
                    stack.append(operand1 + operand2)
                case "-":
                    let operand1: Int = stack.removeLast()
                    let operand2: Int = stack.removeLast()
                    stack.append(operand2 - operand1)
                case "*":
                    let operand1: Int = stack.removeLast()
                    let operand2: Int = stack.removeLast()
                    stack.append(operand1 * operand2)
                case "/":
                    let operand1: Int = stack.removeLast()
                    let operand2: Int = stack.removeLast()
                    stack.append(operand2 / operand1)
                default:
                    stack.append(Int(tokens[i])!)
            }

        }
        return stack.first ?? 0
    }

}