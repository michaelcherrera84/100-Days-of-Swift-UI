import Cocoa

/// How to store ordered data in arrays

var beatles = ["Paul", "George", "Ringo", "John"]
let numbers = [1, 2, 4, 8, 16]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

//temperatures.append("Chris")  // Cannot convert value of type 'String' to expected argument type 'Double'

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber  //Binary operator '+' cannot be applied to operands of type 'String' and 'Int'

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

//var albums = Array<String>()  // or
//var albums = [String]() // or
//var albums: [String] = [] // or
var albums = [] as [String]
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Dr. No", "From Russia with Love", "Goldfinger", "Thunderball"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


/// How to store and find data in dictionaries

var employee = ["Taylor Swift", "Singer", "Nashville"]

print("Name: \(employee[0])")
employee.remove(at: 1)
print("Job title: \(employee[1])")
//print("Location: \(employee[2])") // Oh no!

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
print(archEnemies)


/// How to use sets for fast data lookup

let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])  // Sets are stored in no particular order
print(actors)

var actors1 = Set<String>()
actors1.insert("Denzel Washington")
actors1.insert("Tom Cruise")
actors1.insert("Nicolas Cage")
actors1.insert("Samuel L Jackson")
print(actors1)
print(actors1.sorted())
print(actors1.contains("Nicolas Cage")) // This is much faster for a set than array


/// How to create and use enums

var selected = "Monday"
selected = "Tuesday"
selected = "January"    // accidentally entered a month
selected = "Friday "    // accidentally added a space

enum Weekday {
    // case monday, tuesday, wednesday, thursday, friday // or
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}  // enums are stored in a highly optimised way

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
//day = Weekday.January  //Type 'Weekday' has no member 'January'
day = .wednesday
day = .thursday


/// How to use type annotations

let surname = "Lasso"   // type String is inferred
var score = 0           // type Int is inferred

let surname1: String = "Lasso"  // type String is explicit
var score1: Double = 0           // type Double is explicit

// types
let playerName: String = "Roy"
let luckyNumber: Int = 7
let pi: Double = 3.14159
var isAuthenticated: Bool = true
var albums1: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

// good for empty array
var teams: [String] = [String]()
var cities1: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

//var style = UIStyle.light  // or
var style: UIStyle = .light
style = .dark

let username: String
// lots of complex logic
username = "@twostraws"
//username = "taylorswift"  //Immutable value 'username' may only be initialized once
// lots more complex logic
print(username)


