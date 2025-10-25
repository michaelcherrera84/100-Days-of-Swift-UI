//
//  Friend.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}
