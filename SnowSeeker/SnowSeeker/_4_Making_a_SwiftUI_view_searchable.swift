//
//  _4_Making_a_SwiftUI_view_searchable.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

struct _4_Making_a_SwiftUI_view_searchable: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            //            Text("Search for \(searchText)")
            //                .searchable(text: $searchText, prompt: "Look for something")
            //                .navigationTitle(Text("Search"))
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Look for something"
            )
            .navigationTitle("Search")
        }
    }
}

#Preview {
    _4_Making_a_SwiftUI_view_searchable()
}
