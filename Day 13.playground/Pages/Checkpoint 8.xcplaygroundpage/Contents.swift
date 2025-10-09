import Cocoa

/// Make a protocol that describes a building.
/// Your protocol should require the following:
/// - A property storing how many rooms it has.
/// - A property storing the costs as an integer.
/// - A property storing the name of the estate agent selling the building.
/// - A method for printing the sales summary of the building.
/// Create two structs, House and Office, that conform to it.

protocol Building {
    var numberOfRooms: Int { get set}
    var cost: Int { get set}
    var estateAgent: String { get set}
    
    func printSalesSummary()
}

struct House: Building {
    var numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSalesSummary() {
        print("This beautiful \(numberOfRooms) room home is currently on the market for $\(cost). Contact \(estateAgent) for more information.")
    }
}

struct Office: Building {
    var numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSalesSummary() {
        print("This sleek \(numberOfRooms) room office is currently on the market for $\(cost). Contact \(estateAgent) for more information.")
    }
}

House(numberOfRooms: 5, cost: 100_000, estateAgent: "John Doe").printSalesSummary()
Office(numberOfRooms: 2, cost: 50_000, estateAgent: "Jack Smish").printSalesSummary()
