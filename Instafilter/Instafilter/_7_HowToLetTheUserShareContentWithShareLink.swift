//
//  _7_HowToLetTheUserShareContentWithShareLink.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import SwiftUI

struct _7_HowToLetTheUserShareContentWithShareLink: View {
    var body: some View {
//        ShareLink(
//            item: URL(string: "https://www.michaelcherrera.com")!,
//            subject: Text("About Me"),
//            message: Text("Check out my GitHub profile!")
//        )
        
//        ShareLink(item: URL(string: "https://www.michaelcherrera.com")!) {
//            Label("About Me", systemImage: "person.fill")
//        }
        
        let example = Image(.example)
        
        ShareLink(item: example, preview: SharePreview("Halloween", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    _7_HowToLetTheUserShareContentWithShareLink()
}
