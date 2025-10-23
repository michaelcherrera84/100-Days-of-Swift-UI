//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Michael C. Herrera on 10/22/25.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
