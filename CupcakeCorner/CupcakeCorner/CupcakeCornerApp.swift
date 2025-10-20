//
//  CupcakeCornerApp.swift
//  CupcakeCorner
//
//  Created by Michael C. Herrera on 10/19/25.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@main
struct CupcakeCornerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
