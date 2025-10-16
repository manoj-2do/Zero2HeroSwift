/*
Protocols are a bit like contracts in Swift.
They let us define what kinds of functionality we expect a data type to support.

Tip: You can conform to as many protocols as you need, 
just by listing them one by one separated with a comma. 
If you ever need to subclass something and conform to a protocol, 
you should put the parent class name first, then write your protocols afterwards.
*/

protocol MobilePhone {
    var model: String { get }
    var batteryLevel: Int { get set }

    func call(to number: String)
    func message(message: String)
    func capture(data: String)
    func shutdown()
    func canJailBreak() -> Bool
}

struct IPhone: MobilePhone {
    var model: String

    var batteryLevel: Int

    init(model: String,batteryLevel: Int){
        self.model = model
        self.batteryLevel = batteryLevel
    }

    func call(to number: String) {
        print("Calling from \(model)")
    }

    func message(message: String) {
        print("Capturing from Model ---> \(model) || Data ---> \(message)")
    }

    func capture(data: String) {
        print("Capturing from Model ---> \(model) || Data ---> \(data)")
    }

    func shutdown() {
        print("Shutting Model ---> \(model)")
    }

    func canJailBreak() -> Bool {
        return true
    }
}

func canJailBreak(phone: MobilePhone){
    if phone.canJailBreak() {
        print("This device is capabale of Jailbreak")
    } else {
        print("Unable to jailbreak")
    }
}


/*
    OPAQUE DATA TYPES -> A type that hides the exact type that is being returned but shows what protocol it follows.
    some = one specific hidden type (opaque).
    any = any type that conforms to a protocol (existential).
    No some or any = return an explicit, concrete type.
*/
protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double
    func area() -> Double { .pi * radius * radius }
}

struct Square: Shape {
    var side: Double
    func area() -> Double { side * side }
}

func makeCircle() -> some Shape {
    return Circle(radius: 200)
}

func makeShape(flag: Bool) -> any Shape {
    if flag {
        return Circle(radius: 5)
    } else {
        return Square(side: 5)
    }
}