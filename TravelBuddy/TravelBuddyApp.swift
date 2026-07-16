//
//  TravelBuddyApp.swift
//  TravelBuddy
//
//  Created by Anjali Minakshi on 14/07/26.
//

import SwiftUI
import FirebaseCore


@main
struct TravelBuddyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
