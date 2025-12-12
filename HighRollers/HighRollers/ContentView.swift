//
//  ContentView.swift
//  HighRollers
//
//  Created by Michael C. Herrera on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice = 1.0
    @State private var numberOfSides = 4.0
    @State private var rollResult: [Int] = []
    
    @State private var isRolling = false
    @State private var rollTicksRemaining = 0

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Number of dice")
                    .font(.headline)
                HStack {
                    Slider(
                        value: $numberOfDice,
                        in: 1...5,
                        step: 1.0,
                        label: {
                            Text("Number of dice: \(Int(numberOfDice))")
                        }
                    )
                    Text("\(Int(numberOfDice))")
                        .frame(width: 30)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .font(.title3.bold())
                        .clipShape(.rect)
                        .cornerRadius(5)
                }
                .padding(.bottom, 10)
                
                Text("Number of sides")
                    .font(.headline)
                HStack {
                    Slider(value: $numberOfSides, in: 4...20, step: 1.0, label: {
                        Text("Number of sides: \(Int(numberOfSides))")
                    })
                    Text("\(Int(numberOfSides))")
                        .frame(width: 30)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .font(.title3.bold())
                        .clipShape(.rect)
                        .cornerRadius(5)
                }
                .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            startRollAnimation()
                        } label: {
                            VStack {
                                Image(systemName: "dice")
                                    .font(.system(size: 100))
                                Text("Click to Roll")
                            }
                        }
                        .foregroundStyle(.black)
                        .padding()
                        
                        HStack {
                            Spacer()
                            if !rollResult.isEmpty {
                                ForEach (rollResult, id: \.self) { die in
                                    Text("\(die)")
                                        .frame(width: 50, height: 50)
                                        .background(.black)
                                        .foregroundStyle(.white)
                                        .font(.title.bold())
                                        .clipShape(.rect)
                                        .cornerRadius(8)
                                }
                            }
                            Spacer()
                        }
                        .frame(maxHeight: .infinity)
                    }
                    Spacer()
                }
            }
            .navigationTitle("High Rollers")
            .padding(.vertical, 50)
            .padding(.horizontal)
        }
    }
    
    func rollDice() {
        rollResult.removeAll()
        for _ in 0..<Int(numberOfDice) {
            rollResult.append(Int.random(in: 1...Int(numberOfSides)))
        }
    }
    
    func startRollAnimation() {
        guard !isRolling else { return }
        
        isRolling = true
        rollTicksRemaining = 10  // Feel free to tweak
        
            // Initialize the display with random values right away
        rollResult = Array(repeating: 0, count: Int(numberOfDice))
        
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
            if rollTicksRemaining > 0 {
                    // Flash random numbers
                for i in 0..<rollResult.count {
                    rollResult[i] = Int.random(in: 1...Int(numberOfSides))
                }
                rollTicksRemaining -= 1
            } else {
                timer.invalidate()
                isRolling = false
                rollDice()      // Final true roll
            }
        }
    }
}

#Preview {
    ContentView()
}
