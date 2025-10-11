//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Michael C. Herrera on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    let choices: [String] = ["rock", "paper", "scissors"]
    let winningChoices: [String] = ["paper", "scissors", "rock"]

    @State private var playerChoice: String?
    @State private var computerChoice: String?
    @State private var winner: String?

    var body: some View {
        ZStack {
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.vertical, 40)

                VStack {
                    Text("1..2..3...Shoot")
                        .bold()
                        .padding(.bottom)
                    HStack(spacing: 30) {
                        ForEach(choices, id: \.self) { choice in
                            Button(action: { play(choice) }) {
                                Image(choice)
                            }
                            .shadow(
                                color: .black.opacity(0.3),
                                radius: 5,
                                x: 0,
                                y: 5
                            )
                            .shadow(
                                color: .white.opacity(0.6),
                                radius: 2,
                                x: 0,
                                y: -2
                            )

                        }
                    }
                }
                .padding(30)
                .frame(minWidth: 350)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth: 4))
                )
                .background(.white)
                .cornerRadius(20)

                Spacer()

                playerChoice != nil
                    ? (VStack {
                        HStack(spacing: 30) {
                            VStack {
                                Text("You")
                                    .bold()
                                Image(playerChoice ?? "")
                                    .padding(.bottom)
                            }
                            Text("vs")
                            VStack {
                                Text("Computer")
                                    .bold()
                                Image(computerChoice ?? "")
                                    .padding(.bottom)
                            }
                        }

                        HStack {
                            if let winner {
                                if winner == "You" {
                                    Text("You Win!")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.green)
                                } else if winner == "Computer" {
                                    Text("Computer Wins!")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.red)
                                } else {
                                    Text("It's a Tie!")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding(.vertical, 30)
                    }
                    .padding(30)
                    .frame(maxWidth: 350)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: StrokeStyle(lineWidth: 4))
                    )
                    .background(.white)
                    .cornerRadius(20)) : nil

                Spacer()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red.gradient)
    }

    func play(_ choice: String) {
        playerChoice = choice
        computerChoice = choices.randomElement()

        if playerChoice
            == winningChoices[choices.firstIndex(of: computerChoice!)!]
        {
            winner = "You"
        } else if playerChoice == computerChoice {
            winner = "Tie"
        } else {
            winner = "Computer"
        }
    }

}

#Preview {
    ContentView()
}
