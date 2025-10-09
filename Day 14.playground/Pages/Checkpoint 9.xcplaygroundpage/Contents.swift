import Cocoa

/// Wriate a function that accepts an optional array of integers, and returns one of those integers randomly.
/// If the array is miss or empty, return a new random number in the range 1 through 10
/// **Write your function in a single line of code**

func returnRandom(_ numbers: [Int]? = nil) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...10)
}

var numbers: [Int] = [1, 2, 3, 4, 5]
print(returnRandom(numbers))

var numbers1: [Int]? = nil
print(returnRandom(numbers1))
