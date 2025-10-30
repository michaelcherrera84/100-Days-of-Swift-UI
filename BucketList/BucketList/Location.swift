//
//  Location.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/30/25.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    #if DEBUG
        static let example = Location(
            id: UUID(),
            name: "Golden Gate Bridge",
            description: "A historic suspension bridge in San Francisco",
            latitude: 37.8199,
            longitude: -122.4783
        )
    #endif

    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
