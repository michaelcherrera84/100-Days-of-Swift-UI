//
//  _8_HowToAskTheUserToLeaveAnAppStoreReview.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import StoreKit
import SwiftUI

struct _8_HowToAskTheUserToLeaveAnAppStoreReview: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    _8_HowToAskTheUserToLeaveAnAppStoreReview()
}
