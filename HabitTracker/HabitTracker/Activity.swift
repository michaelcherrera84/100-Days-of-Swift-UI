//
//  Activity.swift
//  HabitTracker
//
//  Created by Michael C. Herrera on 10/18/25.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
}
