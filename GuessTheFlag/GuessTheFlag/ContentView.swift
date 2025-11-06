//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michael C. Herrera on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland",
        "Spain", "UK", "Ukraine", "US",
    ].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var restartGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var turns = 0
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stipe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe, bottom stripe gold",
        "Ireland": "Three vertical stipes. Left stipe green, middle stipe white, right stripe orange.",
        "Italy": "Flag with three verticle stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe whilte, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe is gold with crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonal, on a blue background",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue backround in the top-left corner.",
    ]

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3
                    ),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3
                    ),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $restartGame) {
            Button("Restart", action: resetGame)
        } message: {
            Text("You final score is \(score). Thanks for playing!")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }

        showingScore.toggle()
    }

    func askQuestion() {
        turns += 1

        if turns == 8 {
            restartGame.toggle()
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func resetGame() {
        score = 0
        turns = -1
        askQuestion()
    }
}

#Preview {
    ContentView()
}
