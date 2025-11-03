//
//  _3_ReadingTheValueOfControls.swift
//  AccessibilitySandbox
//
//  Created by Michael C. Herrera on 11/1/25.
//

import SwiftUI

struct _3_ReadingTheValueOfControls: View {
    @State private var value = 10

    var body: some View {
        VStack {
            Text("Value: \(value)")

            Button("Increment") {
                value += 1
            }

            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment: value += 1
            case .decrement: value -= 1
            @unknown default: print("Not handled")
            }
        }
    }
}

#Preview {
    _3_ReadingTheValueOfControls()
}
