//
//  HomeView.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var appState: AppState = AppState()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(state: appState)) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: FavouritePrimeView(state: $appState.favouriteAppState)) {
                    Text("Favourite prime")
                }
            }
        }
    }
}
