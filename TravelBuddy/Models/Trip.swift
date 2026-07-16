import Foundation
import FirebaseFirestore
import Combine

struct Trip: Identifiable, Codable {
    
    @DocumentID
    var id: String?
    var title: String
    var startLocationName: String
    var destinationName: String
    var startLatitude: Double
    var startLongitude: Double
    var destinationLatitude: Double
    var destinationLongitude: Double
    var startDate: Date
    var endDate: Date
    var budget: Double
    var notes: String
}

