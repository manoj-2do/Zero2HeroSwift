import Foundation
import Combine

/*
    Knowing the Difference between NS(NeXTSTEP)Object and Swift Object
    It’s basically the ultimate parent that gives your object the most essential behaviors/

    NSObject acts as the common base type that allows Swift objects to talk to Objective-C ones.

    In modern Swift development, you only use KVO when you absolutely must — for example:
    -> Observing system classes that still use it internally (like AVPlayer, URLSessionTask, etc.)
    -> Interacting with legacy Objective-C frameworks
*/

//Using NS OBJECT
class Dog: NSObject {
    @objc dynamic var name: String
    init(_ name: String) {
        self.name = name
    }
}

// let dog = Dog("Killer")
// let observer: NSKeyValueObservation = dog.observe(\.name, options: [.old, .new]) { object, change in
//     print("Dog name changed from \(change.oldValue ?? "<<null>>") to \(change.newValue ?? "<<null>>")")
// }
// dog.name = "Gullu"

//USING OBSERVABLEOBJECT
@available(macOS 10.15, *)
class Cat: ObservableObject {
    @Published var name: String
    init(_ name: String) {
        self.name = name
    }
}
// var cancellable: AnyCancellable?

// let cat = Cat("Jenny")
// cancellable = cat.$name.dropFirst().sink { newName in
//     print("New name: \(newName)")
//     cancellable?.cancel() //Cancel Stream after first update
// }
// cat.name = "Blackie"
// cat.name = "Ola"

//USING CUSTOMOBSERVABLE 
typealias NameObserver = (String) -> Void

class Dolphin {
    var name: String {
        didSet {
            namePublisher.publish(name)
        }
    }

    let namePublisher = CustomPublisher<String>()
    init(_ name: String) { self.name = name } 
}

/*
    Example:
        let dolphin = Dolphin("Blue")
        let id = dolphin.namePublisher.subscribe { newName in
                print("Name changed to: \(newName)")
        }
        dolphin.name = "coral"

*/
