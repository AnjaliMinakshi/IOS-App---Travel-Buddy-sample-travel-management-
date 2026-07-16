import SwiftUI
import MapKit

struct RouteMapView: View {

    @ObservedObject var mapManager: MapManager

    @State private var camera: MapCameraPosition = .automatic

    var body: some View {

        Map(position: $camera) {

            if let start = mapManager.startLocation {

                Marker(
                    "Start",
                    coordinate: start.placemark.coordinate
                )
                .tint(.green)

            }

            if let destination = mapManager.destinationLocation {

                Marker(
                    "Destination",
                    coordinate: destination.placemark.coordinate
                )
                .tint(.red)

            }

            if let route = mapManager.route {

                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)

            }

        }
        .onChange(of: mapManager.route) { _, newRoute in

            guard let newRoute else { return }

            camera = .rect(newRoute.polyline.boundingMapRect)

        }
        if let route = mapManager.route {

            HStack {

                Image(systemName: "road.lanes")

                Text("Distance: \(route.distance / 1000, specifier: "%.1f") km")

//                Spacer()

            }
            .font(.headline)
            .padding()

        }

    }

}

#Preview {

    RouteMapView(
        mapManager: MapManager()
    )

}
