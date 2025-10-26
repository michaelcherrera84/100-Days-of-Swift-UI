//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
