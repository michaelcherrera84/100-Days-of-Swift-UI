//
//  ContentView.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var userDetailIsShown: Bool = false

    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink(value: user) {
                    HStack {
                        Text(user.name)
                            .font(.headline)

                        Spacer()

                        Text(user.isActive ? "✅" : "")
                    }
                }
            }
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .task {
                if !users.isEmpty { return }
                users = await User.loadUsers() ?? []
            }
        }
    }
}

#Preview {
    ContentView()
}
