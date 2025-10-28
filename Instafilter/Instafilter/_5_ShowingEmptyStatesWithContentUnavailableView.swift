//
//  _5_ShowingEmptyStatesWithContentUnavailableView.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import SwiftUI

struct _5_ShowingEmptyStatesWithContentUnavailableView: View {
    var body: some View {
//        ContentUnavailableView(
//            "No snippets",
//            systemImage: "swift",
//            description: Text("You don't have any saved snippets yet.")
//        )
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    _5_ShowingEmptyStatesWithContentUnavailableView()
}
