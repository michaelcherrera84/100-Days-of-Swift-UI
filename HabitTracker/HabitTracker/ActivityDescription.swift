//
//  ActivityDescription.swift
//  HabitTracker
//
//  Created by Michael C. Herrera on 10/18/25.
//

import SwiftUI

struct ActivityDescription: View {
    @Bindable var activities: Activities
    @State private var activity: Activity

    private var completionCount: Int {
        return activity.completionCount
    }

    var body: some View {
        VStack {
            Text(activity.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 50)

            Text("Completed ^[\(completionCount) time](inflect: true).")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)

            Spacer()

            Button("Complete Activity") {
                completeActivity()
            }
            .padding(20)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.rect)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.5), radius: 3)
        }
        .navigationTitle(activity.title)
    }

    init(activities: Activities, activity: Activity) {
        self.activities = activities
        self.activity = activity
    }

    func completeActivity() {
        if let index = activities.items.firstIndex(of: activity) {
            var updated = activity
            updated.completionCount += 1
            activities.items[index] = updated
            activity = updated
        }
    }
}

#Preview {
    let activities = Activities()
    let activity = activities.items.first ?? Activity(title: "Test", description: "Test")
    ActivityDescription(activities: activities, activity: activity)
}
