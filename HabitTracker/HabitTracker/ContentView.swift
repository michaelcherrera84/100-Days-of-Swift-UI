//
//  ContentView.swift
//  HabitTracker
//
//  Created by Michael C. Herrera on 10/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var showingAddActivity = false
    @State private var activities = Activities()

    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(value: item) {
                        Text(item.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationDestination(for: Activity.self) { activity in
                ActivityDescription(activities: activities, activity: activity)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Activity", systemImage: "plus") {
                        showingAddActivity = true
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }

    func deleteItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
