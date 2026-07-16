import SwiftUI
import FirebaseAuth

struct HomeView: View {

    @StateObject private var authManager = AuthManager.shared
    @StateObject private var tripManager = TripManager.shared
    
    @State private var showAddTrip = false

    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Group {
                    if tripManager.trips.isEmpty {
                        VStack(spacing: 20) {
                            
                            Image(systemName: "airplane.circle")
                                .font(.system(size: 70))
                                .foregroundStyle(.gray)
                            
                            Text("No Trips Yet")
                                .font(.title2)
                                .bold()
                            
                            Text("Tap + to create your first trip.")
                                .foregroundStyle(.gray)
                        }
                    }else {
                        List {
                            ForEach (tripManager.trips) { trip in
                                NavigationLink {
                                    TripDetailView(trip: trip)
                                } label: {
                                    TripCardView(trip: trip)
                                }
                                .buttonStyle(.plain)
                            }
                            .onDelete(perform: deleteTrip)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    showAddTrip = true
                } label : {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                }
                .padding()
            }
            .navigationTitle("My Trips")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Logout") {
                        authManager.signOut()
                    }
                }
            }
            .sheet(isPresented: $showAddTrip) {
                AddTripView()
            }
            .onAppear {
                tripManager.fetchTrips()
            }
        }
        
    }
    private func deleteTrip(at offsets: IndexSet) {

        offsets.forEach { index in

            let trip = tripManager.trips[index]

            tripManager.deleteTrip(trip)

        }

    }
}

#Preview {

    HomeView()

}
