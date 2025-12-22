//
//  Facility.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String

    private let icons = [
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accommodation": "SnowSeeker provides a wide range of lodging options, from cozy cabins to luxurious hotels, catering to all budgets and preferences.",
        "Beginners": "Our beginner-friendly programs are designed to help you get started on your snow adventures, with activities that are both fun and safe for all ages.",
        "Cross-country": "Whether you're a seasoned skier or a first-timer, our cross-country programs offer a variety of trails to suit all skill levels, ensuring a memorable experience for everyone.",
        "Eco-friendly": "We are committed to sustainability and environmental responsibility. Our programs and accommodations are designed to minimize our carbon footprint and promote eco-friendly practices.",
        "Family": "Our family-oriented programs are designed to bring the whole family together for a day of fun and adventure on the slopes, with activities that cater to the diverse interests of all ages."
    ]

    var icon: some View {
        if let iconName = icons[name] {
            Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundStyle(.secondary)
        } else {
            fatalError("Unkown facility type: \(name)")
        }
    }
    
    var description: String {
        if let message = descriptions[name] {
            message
        } else {
            fatalError("Unkonwn facility type: \(name)")
        }
    }
}
