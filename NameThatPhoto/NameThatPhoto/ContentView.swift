//
//  ContentView.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/8/25.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var selectedImage: Image?
    @State private var addNameIsShown = false

    @State private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.namedPhotos.sorted(), id: \.self) { photo in
                NavigationLink {
                    PhotoDetailView(photo: photo)
                } label: {
                    if let uiImage = UIImage(data: photo.photo) {
                        HStack {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .padding(.trailing, 5)

                            Text(photo.name)
                        }
                    }
                }
            }
            .navigationTitle("Name That Photo")
            .toolbar {
                PhotosPicker(selection: $pickerItem) {
                    Label("Select an image", systemImage: "plus")
                }
            }
            .onChange(of: pickerItem) { _, newValue in
                Task {
                    if let loadedImage = try await newValue?.loadTransferable(type: Data.self) {
                        imageData = loadedImage
                        if let uiImage = UIImage(data: loadedImage) {
                            await MainActor.run {
                                selectedImage = Image(uiImage: uiImage)
                                pickerItem = nil
                                addNameIsShown = true
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $addNameIsShown) {
            AddDetailsView(
                selectedImage: selectedImage,
                imageData: imageData
            ) { newNamedPhoto in
                viewModel.add(namedPhoto: newNamedPhoto)
            }
        }
    }
}

#Preview {
    ContentView()
}
