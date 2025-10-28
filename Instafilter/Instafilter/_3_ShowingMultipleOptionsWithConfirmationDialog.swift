//
//  _3_ShowingMultipleOptionsWithConfirmationDialog.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import SwiftUI

struct _3_ShowingMultipleOptionsWithConfirmationDialog: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Button( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/) {
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    _3_ShowingMultipleOptionsWithConfirmationDialog()
}
