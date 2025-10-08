import Cocoa

/// Create a struct to store information about a car. Include:
/// - Its model
/// - Number of seaets
/// - Current gear
/// Add a method to change gears up or down.
/// Have a think about variables and access control.
/// Don't allow invalid gears - 1...10 seems a fair maxium range.

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1
    
    mutating func changeGear(by amount: Int) -> Bool {
        if currentGear + amount >= 1 && currentGear + amount <= 10 {
            currentGear += amount
            return true
        } else {
            return false
        }
    }
    
    func printInfo() {
        print("Model: \(model), Seats: \(numberOfSeats), Gear: \(currentGear)")
    }
}

var myCar = Car(model: "Volkswagen Jetta", numberOfSeats: 5)
myCar.changeGear(by: 2)
myCar.changeGear(by: -1)
myCar.printInfo()
