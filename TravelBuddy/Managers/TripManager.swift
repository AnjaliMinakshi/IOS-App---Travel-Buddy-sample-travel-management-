import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestore
import Combine

class TripManager: ObservableObject {

    static let shared = TripManager()

    @Published var trips: [Trip] = []

    private let db = Firestore.firestore()

    private init() { }
    
    //for fetching trips from firestore (for real time update)
    func fetchTrips() {

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        db.collection("users")
            .document(uid)
            .collection("trips")
            .order(by: "startDate")
            .addSnapshotListener { snapshot, error in

                guard let documents = snapshot?.documents else {
                    return
                }

                self.trips = documents.compactMap {

                    try? $0.data(as: Trip.self)

                }

            }

    }
    //Add trip
    func addTrip(_ trip: Trip) {

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        do {

            try db.collection("users")
                .document(uid)
                .collection("trips")
                .addDocument(from: trip)

        } catch {

            print(error.localizedDescription)

        }

    }
    //deleting trip
    func deleteTrip(_ trip: Trip) {

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        guard let id = trip.id else {
            return
        }

        db.collection("users")
            .document(uid)
            .collection("trips")
            .document(id)
            .delete()

    }
    //upsating trip
    func updateTrip(_ trip: Trip) {

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        guard let id = trip.id else {
            return
        }

        do {

            try db.collection("users")
                .document(uid)
                .collection("trips")
                .document(id)
                .setData(from: trip)

        } catch {

            print(error.localizedDescription)

        }

    }
}
