import Cocoa

/// ## Checkpoint 2
/// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array

let arrayOfStrings: [String] = ["a", "b", "c", "a", "b", "c"]
print("Number of items: \(arrayOfStrings.count)")
print("Number of unique items: \(Set(arrayOfStrings).count)")
