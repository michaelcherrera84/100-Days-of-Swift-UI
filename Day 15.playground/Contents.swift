import Cocoa

var name = "Ted"
name = "Rebecca"

let user = "Daphne"
print(user)

let actor = "Tom Cruise 🏃‍♂️"

let quote = "He tapped a sign saying \"Believe\" and walked a way"

let movie = """
    A day in
    the life of an
    Apple engineer
    """

print(actor.count)

print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

let score = 10
let higherscore = score + 10
let havledScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)

let score1 = 3.0  // Double

let goodDogs = true
let gameover = false
var isSaved = false
isSaved.toggle()

let name1 = "Taylor"
let age = 26
let message = "I'm \(name1) and I'm \(age) years old."
print(message)

var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")
colors.remove(at: 0)
print(colors.count)
print(colors.contains("Octarine"))

let employee = [
    "name": "Taylor",
    "job": "Singer",
]

print(employee["job", default: "Unknown"])

var numbers1 = Set([1, 1, 3, 5, 7, 9])
print(numbers)

numbers1.insert(10)
numbers1.contains(11)

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday

var score2: Double = 0

let player: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.14159
var isEnabled: Bool = true
var albums: [String] = ["Red", "Fearless"]
//var albums: [String] = ...
var user1: [String: String] = ["id": "@twostraws"]
//var user1: [String: String] = ...
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var teams: [String] = [String]()
var clues = [String]()

enum UIStyle {
    case light, dar, system
}

var style: UIStyle = .light

let age1 = 16

if age1 < 12 {
    print("You can't vote.")
} else if age < 18 {
    print("You can vote soon")
} else {
    print("You can vote now")
}

let temp = 26
if temp > 20 || temp < 30 {
    print("Its a nice day.")
}

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day")
case .rain:
    print("pack an umbrella")
default:
    print("Should be okay")
}

let age2 = 18
let canvote = age >= 18 ? "Yes" : "No"

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os)")
}

for i in 1...12 {  // for i in 1..<12 to count to 11
    print("5 x \(i) is \(5 * i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

var count = 10
while count > 0 {
    print("\(count)")
    count -= 1
}
print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]
for file in files {
    if !file.hasSuffix(".jpg") {
        continue
    }
    print("Fount picture: \(file)")
}

func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(number: 8)

func rollDice() -> Int {
    Int.random(in: 1...6)  // or return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let (firstName, _) = getUser()
print("Name: \(firstName)")

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO WORLD"
let result1 = isUppercase(string)

func printTimesTable1(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable1(for: 5)

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hi, \(person)")
    }
}

greet("Tim", formal: true)
greet("Taylor")

enum PasswordError: Error {
    case short, obvious
}

func checkPassowrd(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}
do {
    let result = try checkPassowrd("12345")
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}
sayHello("Taylor")

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

let onlyT1 = team.filter { $0.hasPrefix("T") }

print(onlyT)

struct Album {
    let title: String
    let artist: String
    var isRealeased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }

    mutating func removeFromSale() {
        isRealeased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

struct Employee {
    let name: String
    var vactionAllowed = 14
    var vactionTaken = 8

    var vacationRemaining: Int {
        get {
            vactionAllowed - vactionTaken
        }

        set {
            vactionAllowed = vactionTaken + newValue
        }
    }
}

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

let account = BankAccount(funds: 100)
print(account.funds)
//account.funds += 1000 // Left side of mutating operator isn't mutable: 'funds' setter is inaccessible

struct AppData {
    static let version = "1.3 beta 2"
    static let settingsFile = "settings.json"
}

print(AppData.version)

class Employee1 {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee1 {
    func work() {
        print("I'm coding for \(hours) hours")
    }

    override func printSummary() {
        print("I spend \(hours) hours a day fighting over tabs vs spaces.")
    }
}
let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

class Actor {
    var name = "Nicolas Cage"
}

var actor1 = Actor()
var actor2 = actor1

actor2.name = "Tom Cruise"
print(actor1.name)
print(actor2.name)

class Site {
    let id: Int

    init(id: Int) {
        self.id = id
        print("Site \(id): I've been created")
    }

    deinit {
        print("Site \(id): I've been destroyed!")
    }
}
for i in 1...3 {
    let site = Site(id: i)
    print("Site \(site.id): I'm in control!")
}

class Singer {
    var name = "Adele"
}

let singer = Singer()
singer.name = "Justin"
print(singer.name)

protocol Vehicle1 {
    var name: String { get }
    var currentPassengers: Int { get set }

    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car1: Vehicle1 {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle1) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car1()
commute(distance: 100, using: car)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote1 = "   The truth is rarely pure and never simple   "
quote1.trim()

let lyrics = """
But I keep cruising
Can't Stop, won't stop moving
"""
print(lyrics.lines.count)

extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is: \(marioOpposite)")
}

func printSquare(of number: Int?) {
    guard let number else {
        print("No number provided.")
        return
    }
    print("The square of \(number) is \(number * number)")
}

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let number1 = Int(input) ?? 0
print(number1)

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
