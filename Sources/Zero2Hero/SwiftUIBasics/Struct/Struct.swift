struct Employee {
    let name: String
    let password: String
    var vacationRemaining: Int

    static let example: Employee = Employee(name: "Tudud", password: "1234", vacationRemaining: 100)

    mutating func takeVacation(days: Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There are'nt enough days remaining")
        }
    }
}

//Property Obsevers
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

//Access Control
struct Bank {
    private var funds: Int
    private(set) var readableFunds: Int 
    //private(set) --> anyone can read this property, but only the methods inside struct can set it.

    init(){
        funds = 100
        readableFunds = 1000
    }

    mutating func deposit(amt: Int) {
        funds += amt
    }

    mutating func withdraw(amt: Int) -> Bool {
        if funds >= amt {
            funds -= amt
            return true
        } else {
            return false
        }
    }
}

//Static Properties of Struct
struct School {
    nonisolated(unsafe) static var studentCount: Int = 0

    static func add(name: String){
        studentCount += 1
    }


}
