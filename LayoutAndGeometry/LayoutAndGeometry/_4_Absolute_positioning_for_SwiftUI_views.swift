//
//  _4_Absolute_positioning_for_SwiftUI_views.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

struct _4_Absolute_positioning_for_SwiftUI_views: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(.red)
//            .position(x: 100, y: 100)
            .offset(x: 100, y: 100)
            .background(.red)
        
    }
}

#Preview {
    _4_Absolute_positioning_for_SwiftUI_views()
}
