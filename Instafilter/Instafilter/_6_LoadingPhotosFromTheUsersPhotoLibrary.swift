//
//  _6_LoadingPhotosFromTheUsersPhotoLibrary.swift
//  Instafilter
//
//  Created by Michael C. Herrera on 10/27/25.
//

import PhotosUI
import SwiftUI

struct _6_LoadingPhotosFromTheUsersPhotoLibrary: View {
    //    @State private var pickerItem: PhotosPickerItem?
    //    @State private var selectedImage: Image?

    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()

    var body: some View {
        VStack {
            //            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)

            //            selectedImage?
            //                .resizable()
            //                .scaledToFit()

//            PhotosPicker("Select a picture", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
            
            PhotosPicker(
                selection: $pickerItems,
                maxSelectionCount: 3,
                matching: .any(of: [.images, .not(.screenshots)])
            ) {
                Label("Select a picture", systemImage: "photo")
            }

            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }

        }
        //        .onChange(of: pickerItem) {
        //            Task {
        //                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
        //            }
        //        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    _6_LoadingPhotosFromTheUsersPhotoLibrary()
}
