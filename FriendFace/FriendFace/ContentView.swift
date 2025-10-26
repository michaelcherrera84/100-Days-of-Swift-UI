//
//  ContentView.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
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
                if !users.isEmpty {
                    print("data already loaded")
                    return
                }
                await saveData()
            }
        }
    }

    func saveData() async {
        guard let loadedUsers = await User.loadUsers() else { return }

        for decodedUser in loadedUsers {
            modelContext.insert(decodedUser)
        }

        do {
            try modelContext.save()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
        
        do {
            let fetchDescriptor = FetchDescriptor<User>()
            let allUsers = try modelContext.fetch(fetchDescriptor)
            print("📦 There are \(allUsers.count) User(s) in the database")
        } catch {
            print("❌ Failed to fetch users:", error.localizedDescription)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        return ContentView()
            .modelContainer(container)
    } catch {
        return EmptyView()
    }
}
