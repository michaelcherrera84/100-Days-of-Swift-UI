//
//  _3_Using_groups_as_transparent_layout_containers.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

@MainActor
struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Michael")
            Text("Country: United States")
            Text("Pets: Fishies")
        }
        .font(.title)
    }
}

struct _3_Using_groups_as_transparent_layout_containers: View {
//    @State private var layoutVertically = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
//        Button {
//            layoutVertically.toggle()
//        } label: {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        if horizontalSizeClass == .compact {
//            VStack(content: UserView.init)
//        } else {
//            HStack(content: UserView.init)
//        }
        
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    _3_Using_groups_as_transparent_layout_containers()
}
