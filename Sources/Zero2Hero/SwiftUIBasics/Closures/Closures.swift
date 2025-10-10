// You can copy functions in Swift, and they work the same as the original except they lose their external parameter names.

class Closures {
    let sayHello = {
        print("Hi! There")
    }

    /* 
        Closures that accept parameters or return a value,
        must declare this inside their braces, followed by the keyword in.
    */
    let sayHelloWithParams: (String) -> ()   = { (name: String) -> Void in 
        print("Hello \(name)")
    }

    let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

    func filterClosureExample() -> Void{
       let fitleredData = team.filter {  $0.hasPrefix("T") }
       print(fitleredData)
    }

    //Function as Params
    func makeArray(size: Int, generator: () -> Int) -> [Int] {
        var numbers = [Int]()
        for _: Int in 0..<size {
            let randomNumber = generator()
            numbers.append(randomNumber)
        }

        return numbers
    }

    //Trailing Closures Example
    /*
        closures.trailingClosure {
            print("First is executing")
        } second: {
            print("Second is executing")
        } third: {
            print("Third is executing")
        }
    */
    func trailingClosure(first: () -> Void, second: () -> Void, third: () -> Void) {
        first()
        print("First Done")
        second()
        print("Second Done")
        third()
        print("Third Done")
    }

    
}