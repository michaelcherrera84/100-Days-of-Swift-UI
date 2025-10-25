//
//  User.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static func loadUsers() async -> [User]? {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return []
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                return decodedResponse
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}
