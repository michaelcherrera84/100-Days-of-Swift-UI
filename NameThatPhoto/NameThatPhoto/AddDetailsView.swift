//
//  AddDetailsView.swift
//  NameThatPhoto
//
//  Created by Michael C. Herrera on 11/11/25.
//

import CoreLocation
import MapKit
import SwiftUI

struct AddDetailsView: View {
    @State private var imageName = ""
    let selectedImage: Image?
    let imageData: Data?
    var onAdd: (NamedPhoto) -> Void
    @Environment(\.dismiss) private var dismiss

    let locationFetcher = LocationFetcher()
    @State private var imageLocation: CLLocationCoordinate2D?

    var body: some View {
        Form {
            Section {
                if let image = selectedImage {
                    image
                        .resizable()
                        .scaledToFit()
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
                
                TextField("Name this image", text: $imageName)
                    .multilineTextAlignment(.center)
            }

            Section("Location") {
                if imageLocation == nil {
                    Button("Add Location") {
                        if let location = locationFetcher.lastKnownLocation {
                            imageLocation = location
                        }
                    }
                } else {
                    Map(
                        initialPosition:
                            MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: imageLocation!,
                                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                )
                            )
                    ) {
                        Marker("Location", coordinate: imageLocation!)
                    }
                    .frame(height: 250)
                    .listRowInsets(EdgeInsets())
                }
            }

            Button("Add Named Photo", systemImage: "sdcard") {
                if let data = imageData {
                    let newNamedPhoto = NamedPhoto(
                        name: imageName,
                        photo: data,
                        latitude: imageLocation?.latitude,
                        longitude: imageLocation?.longitude
                    )
                    onAdd(newNamedPhoto)
                    dismiss()
                }
            }
        }
        .onAppear(perform: locationFetcher.start)
    }
}

#Preview {
    AddDetailsView(
        selectedImage: Image(systemName: "person.circle"),
        imageData: UIImage(systemName: "person.circle")?.pngData(),
        onAdd: { _ in }
    )
}
