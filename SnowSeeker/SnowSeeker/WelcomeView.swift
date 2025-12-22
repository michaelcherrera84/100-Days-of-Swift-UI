//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu. Swipe left to see more.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
