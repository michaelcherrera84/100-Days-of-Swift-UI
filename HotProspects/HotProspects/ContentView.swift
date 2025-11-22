//
//  ContentView.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contactd", systemImage: "checkmark.circle")
                }
            
            ProspectsView(filter: .uncontected)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Prospect.self, inMemory: true)
}
