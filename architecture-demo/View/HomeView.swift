//
//  HomeView.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var appState: Store<AppState,AppAction> = .init(value: AppState(), reducer: appReducer)
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(state: appState)) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: FavouritePrimeView(state: $appState.value.favouriteAppState)) {
                    Text("Favourite prime")
                }
            }
        }
    }
}
