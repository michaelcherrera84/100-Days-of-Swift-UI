//
//  ContentView.swift
//  Animations
//
//  Created by Michael C. Herrera on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var one = false
    @State private var two = false
    @State private var three = false
    
    @State private var offsetOne = CGSize.zero
    @State private var offsetTwo = CGSize.zero
    @State private var offsetThree = CGSize.zero
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 300, height: 100)
                .opacity(one ? 0.2 : 1)
                .animation(.easeOut, value: two || three)
                .onTapGesture {
                    two.toggle()
                    three.toggle()
                }
                .offset(offsetOne)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetOne = value.translation
                        }
                        .onEnded { _ in
                            offsetOne = .zero
                        }
                )
                .rotation3DEffect(.degrees(one ? 360 : 0), axis: (x: 0, y: 0, z: 1))
                .animation(.default, value: one)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .stroke(.black)
                .frame(width: 300, height: 100)
                .opacity(two ? 0.2 : 1)
                .animation(.easeOut, value: one || three)
                .onTapGesture {
                    one.toggle()
                    three.toggle()
                }
                .offset(offsetTwo)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetTwo = value.translation
                        }
                        .onEnded { _ in
                            offsetTwo = .zero
                        }
                )
                .rotation3DEffect(.degrees(two ? 360 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(.default, value: two)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .frame(width: 300, height: 100)
                .opacity(three ? 0.2 : 1)
                .animation(.easeOut, value: one || two)
                .onTapGesture {
                    one.toggle()
                    two.toggle()
                }
                .offset(offsetThree)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetThree = value.translation
                        }
                        .onEnded { _ in
                            offsetThree = .zero
                        }
                )
                .rotation3DEffect(.degrees(three ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.default, value: three)
        }
    }
}

#Preview {
    ContentView()
}
