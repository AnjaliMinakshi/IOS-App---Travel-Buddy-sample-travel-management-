import Foundation
import MapKit
import Combine

class SearchManager: NSObject, ObservableObject {

    @Published var query = ""

    @Published var suggestions: [MKLocalSearchCompletion] = []

    private let completer = MKLocalSearchCompleter()

    override init() {
        super.init()

        completer.delegate = self
        completer.resultTypes = [.address, .pointOfInterest]
    }

    func search(_ text: String) {

        query = text
        completer.queryFragment = text

    }

}

extension SearchManager: MKLocalSearchCompleterDelegate {

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {

        DispatchQueue.main.async {

            self.suggestions = completer.results

        }

    }

    func completer(_ completer: MKLocalSearchCompleter,
                   didFailWithError error: Error) {

        print(error.localizedDescription)

    }

}
