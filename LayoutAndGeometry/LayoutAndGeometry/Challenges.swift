//
//  Challenge1.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

struct Challenges: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        // distance from the top of the screen to the top of the row
                        let minY = proxy.frame(in: .global).minY
                        
                        let fadeStart: CGFloat = 200        // point where fading begins
                        let fadeEnd: CGFloat = 50           // point where opacity becomes 0
                        
                        // (minY - fadeEnd) → how far the row is past the very top
                        // (fadeStart - fadeEnd) → size of the fade zone (200 → 50)
                        // Clamping with max/min guarantees opacity stays in the safe range.
                        let opacity = max(0, min(1, (minY - fadeEnd) / (fadeStart - fadeEnd)))
                        
                        // Convert y-value into a percetage of screen and clamp between 0 and 1
                        let position = min(1, minY / fullView.size.height)
                        // Scale from 76% to 125%
                        let scale = max(0.75, position * 1.25)
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: position, saturation: 1, brightness: 1))
                            .opacity(opacity)
                            .scaleEffect(scale)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    Challenges()
}
