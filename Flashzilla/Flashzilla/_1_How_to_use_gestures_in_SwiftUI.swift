//
//  _1_How_to_use_gestures_in_SwiftUI.swift
//  Flashzilla
//
//  Created by Michael C. Herrera on 11/23/25.
//

import SwiftUI

struct _1_How_to_use_gestures_in_SwiftUI: View {
    //    @State private var currentAmount = 0.0
    //    @State private var finalAmount = 1.0

    //    @State private var currentAmount = Angle.zero
    //    @State private var finalAmount = Angle.zero

    @State private var offset = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        //        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
        ////            .onTapGesture(count: 2) {
        ////                print("Double tapped!")
        ////            }
        ////            .onLongPressGesture {
        ////                print("Long tapped!")
        ////            }
        ////            .onLongPressGesture(minimumDuration: 2) {
        ////                print("Long pressed!")
        ////            } onPressingChanged: { inProgress in
        ////                print("In progress: \(inProgress)")
        ////            }
        ////            .scaleEffect(finalAmount + currentAmount)
        //            .rotationEffect(currentAmount + finalAmount)
        //            .gesture(
        ////                MagnifyGesture().onChanged { value in
        ////                    currentAmount = value.magnification - 1
        ////                }.onEnded { value in
        ////                    finalAmount += currentAmount
        ////                    currentAmount = 0
        ////                }
        //                RotateGesture()
        //                    .onChanged { value in
        //                        currentAmount = value.rotation
        //                    }
        //                    .onEnded { value in
        //                        finalAmount += currentAmount
        //                        currentAmount = .zero
        //                    }
        //            )
        //        VStack {
        //            Text("Hello, world!")
        //                .onTapGesture {
        //                    print("Text tapped")
        //                }
        //        }
        //        /*.highPriorityGesture*/.simultaneousGesture(
        //            TapGesture()
        //                .onEnded {
        //                    print("VStack tapped")
        //                }
        //        )

        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation { isDragging = true }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    _1_How_to_use_gestures_in_SwiftUI()
}
