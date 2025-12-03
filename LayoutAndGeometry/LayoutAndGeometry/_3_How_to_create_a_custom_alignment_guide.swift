//
//  _3_How_to_create_a_custom_alignment_guide.swift
//  LayoutAndGeometry
//
//  Created by Michael C. Herrera on 12/3/25.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct _3_How_to_create_a_custom_alignment_guide: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@michaelcherrera")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                
                Image(.sample)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("Michael Herrera")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    _3_How_to_create_a_custom_alignment_guide()
}
