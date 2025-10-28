//
//  _4_IntegratingCoreImageWithSwiftUI.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct _4_IntegratingCoreImageWithSwiftUI: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        //        image = Image(.example)
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()

        currentFilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

        currentFilter.radius = 400
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)

        image = Image(uiImage: uiImage)
    }
}

#Preview {
    _4_IntegratingCoreImageWithSwiftUI()
}
