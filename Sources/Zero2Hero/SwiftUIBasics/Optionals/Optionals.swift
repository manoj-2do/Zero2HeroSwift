/*
    Optionals -> This might mean it has a value or might not.”
    nil coalescing -> ??

    You’ll find [try?] is mainly used in three places:
    1. In combination with guard let to exit the current function if the try? call returns nil.
    2. In combination with nil coalescing to attempt something or provide a default value on failure.
    3. When calling any throwing function without a return value
*/

func optionalsExample(){
    let optNum: Int? = 100

    if let optNum = optNum {
       print("Working \(optNum)")
    }

    //What’s happening here is that we’re temporarily creating a second constant of the same name, 
    // available only inside the condition’s body. This is called shadowing, and 
    // it’s mainly used with optional unwraps

    //Unwrapping using guard
    guard let num = optNum else { return }
    print("Working \(num)")

    let captains = [
        "Enterprise": "Picard",
        "Voyager": "Janeway",
        "Defiant": "Sisko",
    ]

    print(captains["name"] ?? "Data not present in captain dict")


    //Handling Function Failures with nil optional
    if let user = try? getUser(id: 23) {
        print("User: \(user)")
    }

    let user2 = (try? getUser(id: 23)) ?? "Ola"
    print(user2)
}

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}
