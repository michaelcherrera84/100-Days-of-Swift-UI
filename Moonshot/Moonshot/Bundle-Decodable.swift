//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Michael C. Herrera on 10/15/25.
//

import Foundation

extension Bundle {
    /// Decodes a JSON file from the app bundle into a specified Codable type.
    ///
    /// This generic helper method simplifies loading and decoding JSON files included
    /// in your app’s bundle. It handles locating the file, reading its data, and decoding
    /// it using `JSONDecoder`. If any step fails, it will terminate execution with a
    /// descriptive error message — making it ideal for use during development.
    ///
    /// - Parameter file: The name of the JSON file to load (including its extension).
    /// - Returns: A decoded instance of the specified `Codable` type `T`.
    ///
    /// - Note: This method uses `fatalError()` for simplicity and should not be used
    ///   for error-handling in production code where graceful failure is preferred.
    func decode<T: Codable>(_ file: String) -> T {
        // Attempt to find the file in the bundle; crash if not found.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // Attempt to load the contents of the file as Data; crash if unable.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Create a JSON decoder for converting the data into the desired type.
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            // Attempt to decode the data into the specified Codable type.
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            // A required key was missing in the JSON.
            fatalError("Failed to decode \(file) due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            // A value had the wrong type (e.g., expected String but found Int).
            fatalError("Failed to decode \(file) due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            // A required value was expected but not found.
            fatalError("Failed to decode \(file) due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            // The JSON file is malformed or invalid.
            fatalError("Failed to decode \(file) because it appears to be invalid JSON.")
        } catch {
            // Catch-all for any other unexpected decoding errors.
            fatalError("Failed to decode \(file): \(error.localizedDescription)")
        }
    }
}
