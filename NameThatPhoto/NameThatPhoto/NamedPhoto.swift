//
//  NamedPhoto.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/8/25.
//

import Foundation

struct NamedPhoto: Codable, Hashable, Comparable {
    let name: String
    let photo: Data
    
    static func < (lhs: NamedPhoto, rhs: NamedPhoto) -> Bool {
        lhs.name < rhs.name
    }
}
