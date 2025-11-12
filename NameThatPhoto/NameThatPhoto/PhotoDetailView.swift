//
//  PhotoDetailView.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/11/25.
//

import MapKit
import SwiftUI

struct PhotoDetailView: View {
    let photo: NamedPhoto

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let uiImage = UIImage(data: photo.photo) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 4)
                        .padding()
                }

                if let coordinate = photo.coordinate {
                    Map(
                        initialPosition: .region(
                            MKCoordinateRegion(
                                center: coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                    ) {
                        Marker(photo.name, coordinate: coordinate)
                    }
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                } else {
                    Text("No location available for this photo")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(photo.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let sampleImageData = UIImage(systemName: "person.circle")?.pngData()
    let samplePhoto = NamedPhoto(
        name: "New Photo",
        photo: sampleImageData ?? Data(),
        latitude: 37.3349,  // Apple HQ, Cupertino
        longitude: -122.0090
    )

    NavigationStack {
        PhotoDetailView(photo: samplePhoto)
    }
}
