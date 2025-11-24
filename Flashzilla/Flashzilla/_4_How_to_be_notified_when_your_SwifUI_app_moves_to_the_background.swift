//
//  _4_How_to_be_notified_when_your_SwifUI_app_moves_to_the_background.swift
//  Flashzilla
//
//  Created by Michael C. Herrera on 11/23/25.
//

import SwiftUI

struct _4_How_to_be_notified_when_your_SwifUI_app_moves_to_the_background: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    _4_How_to_be_notified_when_your_SwifUI_app_moves_to_the_background()
}
