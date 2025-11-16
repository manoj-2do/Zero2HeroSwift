/*
    Swift uses Grand Central Dispatch and the API for it is DispatchQueue

    **Threads in Swift
    1. Main Thread (Runs UI Work)
    2. Globlal/Background Thread (for Heavy and Slow Tasks)
    3. Custom Thread
*/

import Foundation
import SwiftUI

struct Queues {
    static func run()  {
        print("Starting demo on thread: \(Thread.isMainThread ? "Main" :"Background")")

        //🧠 Main Queue = Serial + Main Thread
        DispatchQueue.main.async {
            print("Running on main threaed: \(Thread.isMainThread)")
        }

        //🧠 Global Queue = Concurrent + Background Threads
        DispatchQueue.global().async {
            print("Running on BG Thread: \(Thread.isMainThread)")
        }

        let serialQueue = DispatchQueue(label: "com.zero2hero.serial")
        serialQueue.async {
            print("Custom Serial Queue: Task 1")
        }

        serialQueue.async {
            print("Custom Serial Queue: Task 2")
        }

        let concurrentQueue =  DispatchQueue(label: "com.zero2hero.concurrent", attributes: .concurrent)
        concurrentQueue.async {
          print("Concurrent Queue: Task 1")
        }

        concurrentQueue.async {
            print("Concurrent Queue: Task 2")
        }

        DispatchQueue.global().async {
            print("🌊 Doing heavy work in background...")
            sleep(2)
            let result = "Data loaded ✅"
            DispatchQueue.main.async {
                print("📲 Updating UI on main with: \(result)")
            }
        }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 1))
    }

    static func runSerialTask() {
        let serialQueue = DispatchQueue(label: "com.zero2hero.serial")
        log("🧩 Starting SERIAL queue example")

        for i in 1...3 {
            serialQueue.async {
                log("🔸 Serial Task \(i) started")
                sleep(1)
                log("🔸 Serial Task \(i) finished")
            }
        }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 6))
    }

    static func runConcurrentTask() {
        let concurrentQueue = DispatchQueue(label: "com.zero2hero.concurrent", attributes: DispatchQueue.Attributes.concurrent)
        log("🧩 Starting SERIAL queue example")

        for i in 1...3 {
            concurrentQueue.async {
                log("🔸 Concurrent Task \(i) started")
                sleep(1)
                log("🔸 Concurrent Task \(i) finished")
            }
        }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 6))
    }

    static func syncQueue() {
        let queue = DispatchQueue(label: "com.zero2hero.sync")
        queue.sync {
            print("Task done synchronously")
        }

        print("This will wait untill above is done")
    }

    /*
        Quality of Service: Tells you how important your task is:
    */
    static func qos() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            log("Download Background") //It will print second
        } //Lowest Priority

        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            log("Task init by User") //It will print first
        } //Highest Priority

    
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
    }

    //Dispatch Group
    static func dispatchGroup() -> Void {
        let group = DispatchGroup()
        let queue = DispatchQueue.global()

        for i in 1...3 {
            group.enter()
            queue.async {
                print("Task started: \(i)")
                sleep(1)
                print("Task ended: \(i)")
                group.leave()
            }
        }

        group.notify(queue: .main) {
            print(" All Task finished")
        }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))

    }

    //Used to limit concurrent access to a resource (like a lock, or throttling tasks).
    static func dispatchSemaphore() {
        let semaphore = DispatchSemaphore(value: 2) // only 2 tasks at once
        let queue = DispatchQueue.global()

        for i in 1...5 {
            queue.async {
                semaphore.wait()
                print("Task \(i) running")
                sleep(2)
                print("Task \(i) ended")
                semaphore.signal()
            }
        }
        
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
    }

    static func barrierBlocks() {
        let queue = DispatchQueue(label: "com.zero2hero.concurrent", attributes: .concurrent)

        queue.async { print("Read 1") }
        queue.async { print("Read 2") }

        queue.async(flags: .barrier) {
            print("Barrier...")
        }

        queue.async { print("Read 3") }

        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
    }

    static func log(_ message: String) {
        let time = String(format:"%.2f", CFAbsoluteTimeGetCurrent());
        print("[\(time)] \(message)")
    }
}