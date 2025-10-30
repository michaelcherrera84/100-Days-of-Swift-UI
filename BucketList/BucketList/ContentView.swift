//
//  ContentView.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/29/25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )

    @State private var viewModel = ViewModel()
    @State private var showingLocationList = false

    var body: some View {
        if viewModel.isUnloced {
            MapReader { proxy in
                
                Map(initialPosition: startPosition) {
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                        }
                    }
                }
                .simultaneousGesture(
                    SpatialTapGesture()
                        .onEnded { position in
                            if let coordinate = proxy.convert(position.location, from: .local) {
                                let newLocation = viewModel.addLocation(at: coordinate)
                                viewModel.selectedPlace = newLocation
                            }
                        }
                )
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
                
                Button("Locations") {
                    showingLocationList = true
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(12)
                .padding()
                .sheet(isPresented: $showingLocationList) {
                    NavigationStack {
                        List(viewModel.locations) { location in
                            Button(location.name) {
                                viewModel.selectedPlace = location
                            }
                        }
                        .navigationTitle("Locations")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Done") { showingLocationList = false }
                            }
                        }
                    }
                }
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
