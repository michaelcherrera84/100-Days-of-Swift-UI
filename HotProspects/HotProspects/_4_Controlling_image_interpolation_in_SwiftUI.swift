//
//  _4_Controlling_image_interpolation_in_SwiftUI.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _4_Controlling_image_interpolation_in_SwiftUI: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    _4_Controlling_image_interpolation_in_SwiftUI()
}
