//
//  _3_IntroductionToSwiftDataAndSwiftUI.swift
//  Bookworm
//
//  Created by Michael C. Herrera on 10/20/25.
//

import SwiftData
import SwiftUI

struct _3_IntroductionToSwiftDataAndSwiftUI: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let newStudent = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(newStudent)
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Student.self, configurations: config)
    
    return _3_IntroductionToSwiftDataAndSwiftUI()
        .modelContainer(container)
}
