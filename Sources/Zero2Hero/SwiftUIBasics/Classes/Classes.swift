/*
DIFFERENCE B/W CLASSES & STRUCT
1. Struct -> Value Type and Class -> Reference Type. 
    So when you copy an instance of a class, both copies share the same data
    - If you change one copy, the other one changes

2. When the final copy of a class instance is destroyed,
    Swift can optionally run a special function called a deinitializer.

3. Even if you make a class constant, 
    you can still change its properties as long as they are variables.
    Doesnot work in case of struct

4. We can perform inheritance in class (Major problem of struct)
*/

class Vehicle {
    var engine: String

    init(engine: String){
        self.engine = engine
    }

    func parentFunc() {
        engine = "Hello"
        print("Hello world")
    }
}

class Alto: Vehicle {
    var name: String

    init() {
        self.name = "Alto"
        super.init(engine: "BS6")
    }

    func run(){
        print("\(name) --> Vroom: Vroom \(engine)")
    }

    override func parentFunc() {
        print("Okay")
    }
}

//If you know for sure that your class should not support inheritance, you can mark it as final
final class Person {
    var name: String

    init(){
        self.name = "Manoj"
    }

    func println(){
        print("\(name) --> Student")
    }

    deinit {
        print("Person \(name) deinitialized")
    }
}
