import Cocoa

/// Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
/// - You can't use the built-in `sqrt()` function or similar - you need dto find the square root yourself.
/// - If the number is less than 1 or greater than 10,000 you should throw an "out of bounds" error.
/// - You should only consider integer square roots.
/// - If you can't find the square root, throw a no root error.

enum MySqrtError: Error {
    case outOfBounds
    case noRoot
}

func mySqrt(_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw MySqrtError.outOfBounds
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    throw MySqrtError.noRoot
}

do {
    try print(mySqrt(26 * 26))
} catch MySqrtError.outOfBounds {
    print("Input number is out of bounds")
} catch MySqrtError.noRoot {
    print("There is no integer square root of this number")
} catch {
    print("An unknown error occurred")
}
