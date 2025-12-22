//
//  _5_Sharing_@Observable_objects_through_SwiftUI's_environment.swift
//  SnowSeeker
//
//  Created by Michael C. Herrera on 12/22/25.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
//    var player: Player
    @Environment(Player.self) var player
    
    var body: some View {
//        Text("Your high score: \(player.highScore)")
        @Bindable var player = player
        Stepper("Highscore: \(player.highScore)", value: $player.highScore)
    }
}

struct _5_Sharing__Observable_objects_through_SwiftUI_s_environment: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
//            HighScoreView(player: player)
            HighScoreView()
        }
        .environment(player)
    }
}

#Preview {
    _5_Sharing__Observable_objects_through_SwiftUI_s_environment()
}
