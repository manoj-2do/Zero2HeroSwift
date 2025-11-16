@main
struct Zero2Hero {
    static func main() -> Void {
        var employee = Employee(name: "Manoj", password: "password",vacationRemaining: 20)
        employee.takeVacation(days: 20)

        let iphone = IPhone(model: "IPhone16", batteryLevel: 100)
        canJailBreak(phone: iphone)


        let shape = makeShape(flag: false)
        let makeCircle = makeCircle()
        print(shape.area())
        print(makeCircle.area())

        var rank = 1
        rank.plusOne()
        print(rank)

        let randomString = "    Lorem Ipsum this is a line with spacing.   "
        print(randomString.trim())

        let num: UInt8 = 11
        print(num.clamp(low: 10, high: 200))

        optionalsExample();

        let dolphin: Dolphin = Dolphin("Blue")
        do{
           let cancellable: CustomCancellable = dolphin.namePublisher.subscribe { newValue in
                print("New name: \(newValue)")
            }
            dolphin.name = "Coral";
            print(cancellable.cancel())
        }

        //Dispatch Queues
        // Queues.syncQueue()
        // Queues.runSerialTask()
        // Queues.qos()
        // Queues.dispatchGroup()
        // Queues.dispatchSemaphore()
        // Queues.barrierBlocks()

        runTaskDemo()
    }
}