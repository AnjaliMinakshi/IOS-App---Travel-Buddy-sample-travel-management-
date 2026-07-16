import SwiftUI

struct TripCardView: View {

    let trip: Trip

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text(trip.title)
                .font(.title3)
                .bold()

            HStack {

                Label(trip.startLocationName, systemImage: "location")

                Spacer()

                Image(systemName: "arrow.right")

                Spacer()

                Label(trip.destinationName, systemImage: "flag.fill")

            }
            .font(.subheadline)
            .foregroundStyle(.gray)

            Divider()

            HStack {

                Label("₹\(Int(trip.budget))", systemImage: "indianrupeesign.circle")

                Spacer()

                Text(trip.startDate.formatted(date: .abbreviated, time: .omitted))

            }
            .font(.caption)
            .foregroundStyle(.secondary)

        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: 3)

    }

}

#Preview {

    TripCardView(
        trip: Trip(
            title: "Goa Trip",
            startLocationName: "Ranchi",
            destinationName: "Goa",
            startLatitude: 0,
            startLongitude: 0,
            destinationLatitude: 0,
            destinationLongitude: 0,
            startDate: Date(),
            endDate: Date(),
            budget: 25000,
            notes: "Enjoy"
        )
    )

}
