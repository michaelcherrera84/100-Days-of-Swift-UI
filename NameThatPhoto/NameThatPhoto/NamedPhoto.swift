//
//  NamedPhoto.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/8/25.
//

import CoreLocation
import Foundation

struct NamedPhoto: Codable, Hashable, Comparable {
    let name: String
    let photo: Data
    let latitude: Double?
    let longitude: Double?

    var coordinate: CLLocationCoordinate2D? {
        guard let latitude, let longitude else { return nil }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static func < (lhs: NamedPhoto, rhs: NamedPhoto) -> Bool {
        lhs.name < rhs.name
    }
}
