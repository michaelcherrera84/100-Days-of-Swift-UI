//
//  _5_Creating_context_menus.swift
//  HotProspects
//
//  Created by Michael C. Herrera on 11/22/25.
//

import SwiftUI

struct _5_Creating_context_menus: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
            
        }
    }
}

#Preview {
    _5_Creating_context_menus()
}
