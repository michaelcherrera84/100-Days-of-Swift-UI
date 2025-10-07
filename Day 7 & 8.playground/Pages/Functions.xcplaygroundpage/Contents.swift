import Cocoa

/// How to return values from functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default, this prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

/// How to return values from functions

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func containsSameLetters(string1: String, string2: String) -> Bool {
    if string1.sorted() == string2.sorted() {
        return true
    }

    return false
}

print(containsSameLetters(string1: "estt", string2: "test"))

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()  // can remove return statement if only 1 line that returns what is promised
}

print(areLettersIdentical(string1: "estt", string2: "test"))

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

func pythagoras1(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c1 = pythagoras1(a: 3, b: 4)
print(c1)

func sayHello() {
    return
}

/// How to return multiple values from function

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

func getUser1() -> [String: String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}

let user1 = getUser1()
print(
    "Name: \(user1["firstName", default: "?"]) \(user1["lastName", default: "?"])"
)

func getUser2() -> (firstName: String, lastName: String) {
    //    (firstName: "Taylor", lastName: "Swift")  //or
    ("Taylor", "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}
let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")

let (firstName, lastName) = getUser2()
print("Name: \(firstName) \(lastName)")

let (firstName1, _) = getUser3()
print("Name: \(firstName1)")

/// How to customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()

    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) {}
func hireEmployee(title: String) {}
func hireEmployee(location: String) {}

let lyric = "I see a red door, and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUppercase(string)

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)

/// How to provide default values for parameters

func printTimesTables1(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables1(for: 5, end: 20)
printTimesTables1(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

/// How to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string1 = "12345"

do {
    let result = try checkPassword(string1)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

let result2 = try! checkPassword(string)
print("Password rating: \(result2)")
