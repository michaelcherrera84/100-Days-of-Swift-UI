//
//  _4_IntegratingMapKitWithSwiftUI.swift
//  BucketList
//
//  Created by Michael C. Herrera on 10/29/25.
//

//import MapKit
//import SwiftUI
//
//struct Location: Identifiable {
//    let id = UUID()
//    var name: String
//    var coordinate: CLLocationCoordinate2D
//}
//
//struct _4_IntegratingMapKitWithSwiftUI: View {
//    //    let position = MapCameraPosition.region(
//    //        MKCoordinateRegion(
//    //            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.127500),
//    //            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//    //        )
//    //    )
//
//    //    @State private var position = MapCameraPosition.region(
//    //        MKCoordinateRegion(
//    //            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.127500),
//    //            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//    //        )
//    //    )
//
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.077)),
//    ]
//    var body: some View {
//        //        Map()
//        ////            .mapStyle(.imagery)
//        ////            .mapStyle(.hybrid)
//        //            .mapStyle(.hybrid(elevation: .realistic))
//
//        //        Map(interactionModes: [.rotate, .zoom])
//        //            .mapStyle(.hybrid(elevation: .realistic))
//
//        //        Map(interactionModes: [])
//        //            .mapStyle(.hybrid(elevation: .realistic))
//
//        //        Map(initialPosition: position)
//        //            .mapStyle(.hybrid(elevation: .realistic))
//
//        VStack {
//            //            Map(position: $position)
//            //                .mapStyle(.hybrid(elevation: .realistic))
//            //                //                .onMapCameraChange { context in
//            //                //                    print(context.region)
//            //                //                }
//            //                .onMapCameraChange(frequency: .continuous) { context in
//            //                    print(context.region)
//            //                }
//
//            //            HStack(spacing: 50) {
//            //                Button("Paris") {
//            //                    position = MapCameraPosition.region(
//            //                        MKCoordinateRegion(
//            //                            center: CLLocationCoordinate2D(latitude: 48.856613, longitude: 2.352222),
//            //                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//            //                        )
//            //                    )
//            //                }
//            //                Button("Tokyo") {
//            //                    position = MapCameraPosition.region(
//            //                        MKCoordinateRegion(
//            //                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
//            //                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//            //                        )
//            //                    )
//            //                }
//            //            }
//
////            Map {
////                ForEach(locations) { location in
////                    //                    Marker(location.name, coordinate: location.coordinate)
////                    Annotation(location.name, coordinate: location.coordinate) {
////                        Text(location.name)
////                            .font(.headline)
////                            .padding()
////                            .background(.blue.gradient)
////                            .foregroundStyle(.white)
////                            .clipShape(.capsule)
////                    }
////                    .annotationTitles(.hidden)
////                }
////            }
//            
//            MapReader { proxy in
//                Map()
//                    .onTapGesture { position in
//                        if let coordinate = proxy.convert(position, from: .local) {
//                            print(coordinate)
//                        }
//                    }
//            }
//        }
//    }
//}
//
//#Preview {
//    _4_IntegratingMapKitWithSwiftUI()
//}
