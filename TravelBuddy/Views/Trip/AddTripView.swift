import SwiftUI
import MapKit
import Combine

struct AddTripView: View {

    @Environment(\.dismiss) private var dismiss

    @StateObject private var tripManager = TripManager.shared
    @StateObject private var searchManager = SearchManager()
    @StateObject private var mapManager = MapManager()

    @State private var title = ""

    @State private var startLocation = ""

    @State private var destination = ""

    @State private var budget = ""

    @State private var startDate = Date()

    @State private var endDate = Date()

    @State private var notes = ""
    
    private var canSave: Bool {

        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !startLocation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !destination.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !budget.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !notes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        Double(budget) != nil &&
        endDate >= startDate

    }

    var body: some View {

        NavigationStack {

            Form {

                Section("Trip Information") {

                    TextField("Trip Title", text: $title)

                    TextField("Budget", text: $budget)
                        .keyboardType(.decimalPad)

                }
                
                //fetching map suggestion location here

                Section("Locations") {

                    LocationSearchView(
                        title: "From",
                        selectedLocation: $startLocation
                    ) { item in

                        mapManager.setStartLocation(item)

                    }

                    LocationSearchView(
                        title: "To",
                        selectedLocation: $destination
                    ) { item in

                        mapManager.setDestinationLocation(item)

                    }

                }
                //routes blue line
                Section("Route Preview") {

                    RouteMapView(mapManager: mapManager)
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                }
                //date selection

                Section("Dates") {

                    DatePicker(
                        "Start Date",
                        selection: $startDate,
                        displayedComponents: .date
                    )

                    DatePicker(
                        "End Date",
                        selection: $endDate,
                        displayedComponents: .date
                    )

                }

                Section("Notes") {

                    TextEditor(text: $notes)
                        .frame(height: 120)

                }

            }

            .navigationTitle("Add Trip")

            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button("Cancel") {

                        dismiss()

                    }

                }

                ToolbarItem(placement: .topBarTrailing) {

                    Button("Save") {

                        let trip = Trip(
                            title: title,
                            startLocationName: startLocation,
                            destinationName: destination,
                            startLatitude: 0,
                            startLongitude: 0,
                            destinationLatitude: 0,
                            destinationLongitude: 0,
                            startDate: startDate,
                            endDate: endDate,
                            budget: Double(budget) ?? 0,
                            notes: notes
                        )

                        tripManager.addTrip(trip)

                        dismiss()

                    }
                    .disabled(!canSave)

                }

            }

        }

    }

}

#Preview {

    AddTripView()

}
