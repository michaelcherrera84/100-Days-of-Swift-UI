//
//  _5_Resizing_images_to_fit_the_screen_using_GeometryReader.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

struct _5_Resizing_images_to_fit_the_screen_using_GeometryReader: View {
    var body: some View {
//        GeometryReader { proxy in
//            Image(.sample)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8)
//        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
//            Image(.sample)
//                .resizable()
//                .scaledToFit()
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8
//                }
            GeometryReader { proxy in
                Image(.sample)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    _5_Resizing_images_to_fit_the_screen_using_GeometryReader()
}
