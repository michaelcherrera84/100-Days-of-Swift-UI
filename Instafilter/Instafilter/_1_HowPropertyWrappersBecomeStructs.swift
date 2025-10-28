//
//  _1_HowPropertyWrappersBecomeStructs.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import SwiftUI

struct _1_HowPropertyWrappersBecomeStructs: View {
    @State private var blurAmount = 0.0 {
        didSet {
            // This doens't work for the slider because the slider bypasses the internal setter and changes the value directly. Meanwhile, the button calls the nonmutating setter.
            print("New value is \(blurAmount)")
        }
    }

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            .blur(radius: blurAmount)

        Slider(value: $blurAmount, in: 0...20)

        Button("Random Blur") {
            blurAmount = Double.random(in: 0...20)
        }
    }
}

#Preview {
    _1_HowPropertyWrappersBecomeStructs()
}
