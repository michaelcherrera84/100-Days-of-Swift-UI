//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import Foundation

extension Bundle {

    /// Loads a file from the app bundle and decodes it into a strongly typed model.
    ///
    /// This method is intended for decoding static resources (such as JSON files)
    /// that are shipped with the app. If the file cannot be found, loaded, or
    /// decoded correctly, the app will terminate with a descriptive error message.
    ///
    /// - Parameter file: The name of the resource file, including its extension
    ///   (for example, `"resorts.json"`).
    /// - Returns: A decoded instance of the specified `Decodable` type.
    ///
    /// - Note: This method uses `fatalError` for failure cases, which makes it
    ///   suitable for development and trusted bundle resources, but not for
    ///   user-supplied or network data.
    func decode<T: Decodable>(_ file: String) -> T {

        // Locate the file in the app bundle.
        // If the file does not exist, this is considered a programmer error.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle.")
        }

        // Load the contents of the file into memory.
        // Failure here usually indicates a corrupted or inaccessible resource.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        // Create a JSON decoder to convert raw data into Swift types.
        let decoder = JSONDecoder()

        do {
            // Attempt to decode the data into the requested type.
            return try decoder.decode(T.self, from: data)

        } catch DecodingError.keyNotFound(let key, let context) {
            // A required key was missing from the JSON.
            fatalError(
                "Failed to decode \(file) from bundle due to missing key '\(key)' - \(context.debugDescription)"
            )

        } catch DecodingError.typeMismatch(_, let context) {
            // A value existed, but its type did not match the expected Swift type.
            fatalError(
                "Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)"
            )

        } catch DecodingError.valueNotFound(let type, let context) {
            // A value was expected but was null or missing.
            fatalError(
                "Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)"
            )

        } catch DecodingError.dataCorrupted(_) {
            // The JSON was malformed or otherwise invalid.
            fatalError(
                "Failed to decode \(file) from bundle because it appears to be invalid JSON."
            )

        } catch {
            // Any other decoding-related error.
            fatalError(
                "Failed to decode \(file) from bundle: \(error.localizedDescription)"
            )
        }
    }
}
