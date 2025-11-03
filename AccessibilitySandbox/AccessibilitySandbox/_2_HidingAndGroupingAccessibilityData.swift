//
//  _2_HidingAndGroupingAccessibilityData.swift
//  AccessibilitySandbox
//
//  Created by Michael C. Herrera on 11/1/25.
//

import SwiftUI

struct _2_HidingAndGroupingAccessibilityData: View {
    var body: some View {
//        Image(decorative: "character")
//        Image(.character)
//            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            
            Text("1000")
                .font(.title)
        }
//        .accessibilityElement(children: .combine)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    _2_HidingAndGroupingAccessibilityData()
}
