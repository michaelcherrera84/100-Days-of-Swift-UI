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
    @State private var questions: [[Question]] = createQuestions()

    @State private var numQuestions = 5
    @State private var numTables = 1
    @State private var currentQuestion = 1
    @State private var currentAnswer: Int? = nil
    @State private var score: Int = 0

    @State private var answerShown: Bool = false
    @State private var finalShown: Bool = false

    private var correct: Bool {
        return currentAnswer == questions[numTables][currentQuestion - 1].c
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Number of practice problems") {
                    Stepper(
                        "**\(numQuestions)**",
                        value: $numQuestions,
                        in: 5...20,
                        step: 5
                    )
                }

                Section("Times tables to practice") {
                    Stepper(
                        "**\(numTables)**'s tables",
                        value: $numTables,
                        in: 1...12,
                        step: 1
                    )
                }

                Section("Problem") {
                    VStack {
                        HStack {
                            Spacer()
                            Text(
                                "\(questions[numTables][currentQuestion - 1].a)  x  \(questions[numTables][currentQuestion - 1].b)  = "
                            )
                            .font(.largeTitle)

                            TextField(
                                "?",
                                value: $currentAnswer,
                                formatter: NumberFormatter()
                            )
                            .font(.largeTitle)
                            .keyboardType(.numberPad)
                            .frame(width: 65)
                            .textFieldStyle(.roundedBorder)
                            .padding(5)
                            .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button("Check") {
                            correct ? score += 1 : ()
                            answerShown.toggle()
                        }
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding()
                        .alert("Answer", isPresented: $answerShown) {
                            Button("OK") {
                                if currentQuestion < numQuestions {
                                    currentQuestion += 1
                                    currentAnswer = nil
                                } else {
                                    finalShown.toggle()
                                }
                            }
                        } message: {
                            correct
                                ? Text("Correct!")
                                : Text(
                                    "Wrong. The correct answer is \(questions[numTables][currentQuestion - 1].c)."
                                )
                        }
                        .alert("Final Score", isPresented: $finalShown) {
                            Button("OK") {
                                score = 0
                                currentQuestion = 1
                                questions = createQuestions()
                                currentAnswer = nil
                            }
                        } message: {
                            Text("\(score) out of \(numQuestions)!")
                        }
                    }
                }
            }
            .navigationTitle("Times Tables")
        }
    }
}

func createQuestions() -> [[Question]] {
    var questions: [[Question]] = Array(repeating: [], count: 13)
    for i in 1...12 {
        for j in 1...12 {
            questions[i].append(Question(a: i, b: j))
        }
        for j in 5...12 {
            questions[i].append(Question(a: i, b: j))
        }
        questions[i].shuffle()
    }
    return questions
}

#Preview {
    ContentView()
}
