@main
struct Zero2Hero {
    static func main() -> Void {
        var employee = Employee(name: "Manoj", password: "password",vacationRemaining: 20)
        employee.takeVacation(days: 20)
        print(Employee.example)
    }
}