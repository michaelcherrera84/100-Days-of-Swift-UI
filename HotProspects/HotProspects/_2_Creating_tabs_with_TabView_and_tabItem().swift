//
//  _2_Creating_tabs_with_TabView_and_tabItem().swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _2_Creating_tabs_with_TabView_and_tabItem__: View {
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    _2_Creating_tabs_with_TabView_and_tabItem__()
}
