//
//  _3_Triggering_events_repeatedly_using_a_timer.swift
//  Flashzilla
//
//  Created by Michael C. Herrera on 11/23/25.
//

import SwiftUI
internal import Combine

struct _3_Triggering_events_repeatedly_using_a_timer: View {
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    @State private var counter = 0
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
    }
}

#Preview {
    _3_Triggering_events_repeatedly_using_a_timer()
}
