//
//  ContentView.swift
//  Navigation
//
//  Created by Michael C. Herrera on 10/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
