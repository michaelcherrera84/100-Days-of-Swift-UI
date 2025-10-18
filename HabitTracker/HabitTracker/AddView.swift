//
//  AddView.swift
//  HabitTracker
//
//  Created by Michael C. Herrera on 10/18/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(0...5)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let item = Activity(title: title, description: description)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
}
