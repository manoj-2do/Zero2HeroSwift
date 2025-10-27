protocol Student {
    var name: String { set get }
    var jobTitle: String { get }
    func study()
}

extension Student {
    func study() {
        print("Default action of a student")
    }
}

struct Manoj: Student {
    private var _name: String
    
    init(){
        self._name = "Testing"
    }

    var name: String {
        get {
            print("Printing....")
            return "Manoj"
        }
        set {
            print("Printing....")
            _name = newValue
        }
    }

    var jobTitle: String {
        get {
             return "Lorem Job"
        }
    }
}