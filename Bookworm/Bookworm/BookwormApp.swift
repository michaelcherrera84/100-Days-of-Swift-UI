//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Michael C. Herrera on 10/20/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//            _3_IntroductionToSwiftDataAndSwiftUI()
        }
//        .modelContainer(for: Student.self)
        .modelContainer(for: Book.self)
    }
}
