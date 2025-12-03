//
//  _6_Understanding_frames_and_coordinate_inside_GeometryReader.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView()
                .background(.green)
            
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print(
                            "Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)"
                        )
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct _6_Understanding_frames_and_coordinate_inside_GeometryReader: View {
    var body: some View {
//        VStack {
//            GeometryReader { proxy in
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                    .frame(width: proxy.size.width * 0.9)
//                    .background(.red)
//            }
//            .background(.green)
//            
//            Text("More text")
//                .background(.blue)
//        }
        
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    _6_Understanding_frames_and_coordinate_inside_GeometryReader()
}
