//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Michael C. Herrera on 10/24/25.
//

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
    let example = User(
        id: UUID(),
        isActive: true,
        name: "Jane Doe",
        age: 30,
        company: "Acme Corp",
        email: "jane.doe@example.com",
        address: "1 Infinite Loop, Cupertino, CA",
        about: "Enthusiastic iOS developer who loves SwiftUI and coffee.",
        registered: Date(),
        tags: ["swift", "ios", "friendface"],
        friends: [
            Friend(id: UUID(), name: "John Appleseed"),
            Friend(id: UUID(), name: "Ava Smith"),
        ]
    )
    UserDetailView(user: example)
}
