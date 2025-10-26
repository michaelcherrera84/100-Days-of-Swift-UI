//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

import SwiftData
import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        Form {
            ZStack {
                Circle()
                    .stroke(user.isActive ? .blue : .primary, lineWidth: 4)
                    .fill(.white)
                    .frame(width: 100, height: 100)
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                    .foregroundColor(user.isActive ? .blue : .primary)
            }
            .frame(maxWidth: .infinity)

            Section {
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
            }

            Section {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(user.tags, id: \.self) { tag in
                            Text("#\(tag)")
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }

            Section("Friends") {
                ForEach(user.friends, id: \.self) { friend in
                    Text(friend.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                }
            }
        }
        .navigationTitle(user.name)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(
            isActive: true,
            name: "Michael Herrera",
            age: 41,
            company: "michaelcherrera.com",
            email: "michael.c.herrera@icloud.com",
            address: "123 Main St, San Francisco, CA 94107",
            about: "Aspirit software engineer",
            registered: .now,
            tags: [
                "swift", "ios", "swiftui", "swift_data", "java", "javascript", "react", "python", "c#", "c++",
                "typescript",
            ],
            friends: [
                Friend(name: "Bree"),
                Friend(name: "Kaden"),
                Friend(name: "Lila"),
                Friend(name: "Ava"),
            ]
        )
        return UserDetailView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
