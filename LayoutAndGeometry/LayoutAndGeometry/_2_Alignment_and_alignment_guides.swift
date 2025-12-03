//
//  _2_Alignment_and_alignment_guides.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

struct _2_Alignment_and_alignment_guides: View {
    var body: some View {
//        Text("Live long and prosper")
//            .frame(width: 300, height: 300, alignment: .topLeading)
        
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            
//            Text("long")
//            
//            Text("and")
//                .font(.title)
//            
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
        VStack (alignment: .leading) {
//            Text("Hello, World!")
//                .alignmentGuide(.leading) { d in
//                    d[.trailing]
//                }
//            Text("This is a longer line of text")
            
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        Double(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    _2_Alignment_and_alignment_guides()
}
