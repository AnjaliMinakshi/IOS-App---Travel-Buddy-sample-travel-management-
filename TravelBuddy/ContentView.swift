//
//  ContentView.swift
//  TravelBuddy
//
//  Created by Anjali Minakshi on 14/07/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthManager.shared

    var body: some View {
        NavigationStack {
            if authManager.user != nil {

                          HomeView()

                      } else {

                          LoginView()
                      }
        }
    }
}

#Preview {
    ContentView()
}

