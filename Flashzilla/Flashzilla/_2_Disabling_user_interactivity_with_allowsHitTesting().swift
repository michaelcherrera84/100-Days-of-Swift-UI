//
//  _2_Disabling_user_interactivity_with_allowsHitTesting().swift
//  Flashzilla
//
//  Created by Michael C. Herrera on 11/23/25.
//

import SwiftUI

struct _2_Disabling_user_interactivity_with_allowsHitTesting__: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//            
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .contentShape(.rect)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
////                .allowsHitTesting(false)
//        }
        
        VStack {
            Text("Hello")
            
            Spacer()
                .frame(height: 100)
            
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    _2_Disabling_user_interactivity_with_allowsHitTesting__()
}
