import SwiftUI

struct TripDetailView: View {

    let trip: Trip

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Text(trip.title)
                    .font(.largeTitle)
                    .bold()

                Group {

                    DetailRow(title: "Start", value: trip.startLocationName)

                    DetailRow(title: "Destination", value: trip.destinationName)

                    DetailRow(title: "Budget", value: "₹\(Int(trip.budget))")

                    DetailRow(title: "Start Date", value: trip.startDate.formatted(date: .abbreviated, time: .omitted))

                    DetailRow(title: "End Date", value: trip.endDate.formatted(date: .abbreviated, time: .omitted))

                }

                VStack(alignment: .leading, spacing: 10) {

                    Text("Notes")
                        .font(.headline)

                    Text(trip.notes)

                }

                Spacer()

            }
            .padding()

        }
        .navigationTitle("Trip Details")
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        TripDetailView(
            trip: Trip(
                title: "Goa",
                startLocationName: "Ranchi",
                destinationName: "Goa",
                startLatitude: 0,
                startLongitude: 0,
                destinationLatitude: 0,
                destinationLongitude: 0,
                startDate: Date(),
                endDate: Date(),
                budget: 15000,
                notes: "Beach Vacation"
            )
        )

    }

}
