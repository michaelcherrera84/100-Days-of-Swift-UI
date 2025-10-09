import Cocoa

/// How to handle missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
//print(square(number: number)) // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'

if let number = number {
    print(square(number: number))
}


/// How to unwrap options with guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is (\(number * number)")
}

var myVar: Int? = 3

if let unwrapped = myVar {
    // Run if myVar has a value inside
}

//guard let unwrapped = myVar else {
//    // Run if myVar doesn't have a value inside
//}


/// How to unwrap optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number1 = Int(input) ?? 0
print(number1)


/// How to handle multiple options using option chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print ("Next in line: \(chosen)")

struct Book1 {
    let title: String
    let author: String?
}

var book1: Book1? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)


/// How to handle funtion failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
