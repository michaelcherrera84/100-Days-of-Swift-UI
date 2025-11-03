//
//  _4_HandlingVoiceInputInSwiftUI.swift
//  AccessibilitySandbox
//
//  Created by Michael C. Herrera on 11/1/25.
//

import SwiftUI

struct _4_HandlingVoiceInputInSwiftUI: View {
    var body: some View {
        Button("John Fitgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    _4_HandlingVoiceInputInSwiftUI()
}
