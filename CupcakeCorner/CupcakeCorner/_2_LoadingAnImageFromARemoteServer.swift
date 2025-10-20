//
//  _2_LoadingAnImageFromARemoteServer.swift
//  CupcakeCorner
//
//  Created by Michael C. Herrera on 10/19/25.
//

import SwiftUI

struct _2_LoadingAnImageFromARemoteServer: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    _2_LoadingAnImageFromARemoteServer()
}
