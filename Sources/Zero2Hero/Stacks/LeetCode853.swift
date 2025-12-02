class LeetCode853 {
    static func carFleet(_ target: Int = 10, _ position: [Int] = [0,4,2], _ speed: [Int] = [2,1,3] ) -> Int {
        var result:[Double] = [Double]()
        let set = Array(zip(position, speed).sorted { $0.0 > $1.0 })
        for (p, s) in set {
            let timeToReachTarget = Double(target - p)/Double(s)

            result.append(timeToReachTarget)

            if result.count >= 2, result[result.count - 1] <= result[result.count - 2] {
                result.removeLast()
            }
        }

        return result.count
    }
}