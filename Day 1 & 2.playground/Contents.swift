import Cocoa

/// How to create variables and constants

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"
//character = "Eloise"      // Cannot do this
//character = "Francesca"   // Cannot assign to value: 'character' is a 'let' constant

var playerName = "Dani"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"


/// How to create strings

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away"

let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count)
let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))


/// How to store whole numbers

let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))


/// How to store decimal numbers

let number1 = 0.1 + 0.2
print(number1)

let a = 1
let b = 2.0
//let c = a + b     // Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
let c = Double(a) + b   // or
let d = a + Int(b)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name1 = "Nicolas Case"
// name = 57   // Cannot assign value of type 'Int' to type 'String'

var rating = 5.0
rating *= 2


/// How to store truth with Booleans

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated: Bool = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


/// How to join strings together

let firstPart = "Hello, "
let secondPart = "World!"
let gretting1 = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

// this is bad. makes 4 different strings
let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote1 = "Then he tapped a sign saying \"Believe\" and walked away."

let name2 = "Taylor"
let age = 26
let message = "Hello, my name is \(name2) and I'm \(age) years old."
print(message)

let number2 = 11
//let missionMessage = "Apollo " + number2 + " landed on the moon." // Cannot convert value of type 'Int' to expected argument type 'String'
var missionMessage = "Apollo " + String(number2) + " landed on the moon."
missionMessage = "Apollo \(number2) landed on the moon."

print("5 x 5 is \(5 * 5)")


/// ## Checkpoint 1
/// Creates a constant holding any temperature in Celsius.
/// Converts that temperature to Fahrenheit by multiplying by 9, dividing by 5, then adding 32
/// Prints the result, showing both the Celsius and Fahrenheit values.

let celsius = 100.0
let fahrenheit = (celsius * 9 / 5) + 32
print("\(celsius)°C is \(fahrenheit)°F")
