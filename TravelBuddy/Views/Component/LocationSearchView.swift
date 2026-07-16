import SwiftUI
import MapKit
import Combine

struct LocationSearchView: View {

    let title: String

    @Binding var selectedLocation: String

    var onLocationSelected: (MKMapItem) -> Void

    @StateObject private var searchManager = SearchManager()

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(title)
                .font(.headline)

            TextField(title, text: $searchManager.query)
                .textFieldStyle(.roundedBorder)
                .onChange(of: searchManager.query) { _, newValue in
                    searchManager.search(newValue)
                }

            if !searchManager.suggestions.isEmpty {

                ScrollView {

                    LazyVStack(alignment: .leading, spacing: 10) {

                        ForEach(searchManager.suggestions, id: \.self) { suggestion in

                            Button {

                                searchLocation(suggestion)

                            } label: {

                                VStack(alignment: .leading) {

                                    Text(suggestion.title)

                                    Text(suggestion.subtitle)
                                        .font(.caption)
                                        .foregroundStyle(.gray)

                                }

                                .frame(maxWidth: .infinity, alignment: .leading)

                            }
                            .buttonStyle(.plain)

                        }

                    }

                }
                .frame(maxHeight: 180)

            }

        }

    }

    private func searchLocation(_ completion: MKLocalSearchCompletion) {

        let request = MKLocalSearch.Request()

        request.naturalLanguageQuery = completion.title + " " + completion.subtitle

        MKLocalSearch(request: request).start { response, error in

            guard let item = response?.mapItems.first else { return }

            DispatchQueue.main.async {

                selectedLocation = item.name ?? completion.title

                searchManager.query = selectedLocation

                searchManager.suggestions.removeAll()

                onLocationSelected(item)

            }

        }

    }

}
