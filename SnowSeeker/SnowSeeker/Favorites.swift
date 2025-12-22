//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites"
    private let url = URL.documentsDirectory.appending(path: "favorites.json")
    
    init() {
        do {
            let rawData = try Data(contentsOf: url)
            resorts = try JSONDecoder().decode(Set<String>.self, from: rawData)
        } catch {
            print("Failed to load resorts: \(error.localizedDescription)")
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print("Failed to save resorts: \(error.localizedDescription)")
        }
    }
}
