//
//  _1_Working_with_two_side_by_side_views_in_SwiftUI.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

struct _1_Working_with_two_side_by_side_views_in_SwiftUI: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)){
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    _1_Working_with_two_side_by_side_views_in_SwiftUI()
}
