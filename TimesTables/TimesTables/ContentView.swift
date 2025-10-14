//
//  ContentView.swift
//  TimesTables
//
//  Created by Michael C. Herrera on 10/13/25.
//

import SwiftUI

struct Question {
    var a: Int
    var b: Int
    var c: Int {
        return a * b
    }
}

struct ContentView: View {
    private var questions: [[Question]] = createQuestions()
    
    @State private var numQuestions = 5
    
    var questionnum: Int {
        return questions[0].count
    }
    
    var body: some View {
        VStack {
            Stepper("Number of questions: \(numQuestions)", value: $numQuestions, in: 1...20, step: 5)
                .labelsHidden()
            .onAppear {
                numQuestions = min(max(0, numQuestions), max(0, questions.count - 1))
            }
        }
        .padding()
    }
}

func createQuestions() -> [[Question]] {
    var questions: [[Question]] = Array(repeating: [], count: 13)
    for i in 1...12 {
        for _ in 0..<20 {
            questions[i].append(Question(a: i, b: .random(in: 1...12)))
        }
    }
    return questions
}

#Preview {
    ContentView()
}
