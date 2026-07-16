import Foundation
import MapKit
import Combine

class MapManager: ObservableObject {

    @Published var startLocation: MKMapItem?

    @Published var destinationLocation: MKMapItem?

    @Published var route: MKRoute?
    
    func setStartLocation(_ item: MKMapItem) {

        startLocation = item

        fetchRoute()

    }
    
    func setDestinationLocation(_ item: MKMapItem) {

        destinationLocation = item

        fetchRoute()

    }
    
    func fetchRoute() {

        guard let start = startLocation,
              let destination = destinationLocation else {
            return
        }

        let request = MKDirections.Request()

        request.source = start
        request.destination = destination
        request.transportType = .automobile

        let directions = MKDirections(request: request)

        directions.calculate { response, error in

            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let route = response?.routes.first else {
                return
            }

            DispatchQueue.main.async {

                self.route = route

            }

        }

    }

}
