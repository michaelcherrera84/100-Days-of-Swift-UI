//
//  _2_RespondingToStateChangesUsingOnChange.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import SwiftUI

struct _2_RespondingToStateChangesUsingOnChange: View {
    @State private var blurAmount = 0.0

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            .blur(radius: blurAmount)

        Slider(value: $blurAmount, in: 0...20)
            .onChange(of: blurAmount) { oldValue, newValue in
                print("New value is \(newValue)")
            }
    }
}

#Preview {
    _2_RespondingToStateChangesUsingOnChange()
}
