//
//  _6_Adding_custom_row_swipe_actions_to_a_List.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _6_Adding_custom_row_swipe_actions_to_a_List: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    _6_Adding_custom_row_swipe_actions_to_a_List()
}
