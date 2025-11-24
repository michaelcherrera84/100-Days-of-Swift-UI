//
//  _5_Supporting_specific_accessibility_needs_with_SwiftUI.swift
//  Flashzilla
//
//  Created by Michael C. Herrera on 11/23/25.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct _5_Supporting_specific_accessibility_needs_with_SwiftUI: View {
    //    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
//    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
//    @State private var scale = 1.0
    
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency

    var body: some View {
        //        HStack {
        //            if accessibilityDifferentiateWithoutColor {
        //                Image(systemName: "checkmark.circle")
        //            }
        //
        //            Text("Success")
        //        }
        //        .padding()
        //        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
        //        .foregroundStyle(.white)
        //        .clipShape(.capsule)

//        Button("Hello, world!") {
//            if accessibilityReduceMotion {
//                scale *= 1.5
//            } else {
//                withAnimation {
//                    scale *= 1.5
//                }
//            }
//        }
//        .scaleEffect(scale)
        
//        Button("Hello, world!") {
//            withOptionalAnimation {
//                scale *= 1.5
//            }
//        }
//        .scaleEffect(scale)
        
        Text("Hello, World!")
            .padding()
            .background(accessibilityReduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(Color.white)
            .clipShape(.capsule)
    }
}

#Preview {
    _5_Supporting_specific_accessibility_needs_with_SwiftUI()
}
