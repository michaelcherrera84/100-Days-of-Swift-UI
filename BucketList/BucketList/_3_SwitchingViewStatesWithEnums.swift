//
//  _3_SwitchingViewStatesWithEnums.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/29/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct _3_SwitchingViewStatesWithEnums: View {
    enum LoadingState {
        case loading, success, failed
    }

    @State private var loadingState: LoadingState = .loading

    var body: some View {
        //        if Bool.random() {
        //            Rectangle()
        //        } else {
        //            Circle()
        //        }
        //        if loadingState == .loading {
        //            LoadingView()
        //        } else if loadingState == .success {
        //            SuccessView()
        //        } else {
        //            FailedView()
        //        }
        switch loadingState {
        case .loading: LoadingView()
        case .success: SuccessView()
        case .failed: FailedView()
        }
    }
}

#Preview {
    _3_SwitchingViewStatesWithEnums()
}
