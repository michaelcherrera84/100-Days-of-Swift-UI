//
//  _1_IdentifyingViewsWithUsefulLabels.swift
//  AccessibilitySandbox
//
//  Created by Michael C. Herrera on 11/1/25.
//

import SwiftUI

struct _1_IdentifyingViewsWithUsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096",
    ]

    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    @State private var selectedPicture = Int.random(in: 0...3)

    var body: some View {
        //        Image(pictures[selectedPicture])
        //            .resizable()
        //            .scaledToFit()
        //            .onTapGesture {
        //                selectedPicture = Int.random(in: 0...3)
        //            }
        //            .accessibilityLabel(labels[selectedPicture])
        //            .accessibilityAddTraits(.isButton)
        //            .accessibilityRemoveTraits(.isImage)

        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
    }
}

#Preview {
    _1_IdentifyingViewsWithUsefulLabels()
}
