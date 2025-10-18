//
//  Activities.swift
//  HabitTracker
//
//  Created by Michael C. Herrera on 10/18/25.
//

import Foundation

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
