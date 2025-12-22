//
//  _2_Using_alert()_and_sheet()_with_optionals.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct _2_Using_alert___and_sheet___with_optionals: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        Button("Tap me") {
            selectedUser = User()
            isShowingUser = true
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) {}
//        }
    }
}

#Preview {
    _2_Using_alert___and_sheet___with_optionals()
}
