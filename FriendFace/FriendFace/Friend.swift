//
//  Friend.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import SwiftData
import Foundation

@Model
class Friend: Codable, Identifiable {
    enum CodingKeys: CodingKey { case id, name }

    var id: UUID
    var name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
