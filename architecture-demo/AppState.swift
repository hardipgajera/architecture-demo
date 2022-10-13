//
//  AppState.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var count: Int = 0
    @Published var favouritePrimeNumbers: [Int] = []
}

extension AppState {
    var favouriteAppState: FavouriteAppState {
        get {
            return FavouriteAppState(favouritePrimeNumbers: self.favouritePrimeNumbers)
        }
        set {
            self.favouritePrimeNumbers = newValue.favouritePrimeNumbers
        }
    }
}


struct FavouriteAppState {
    var favouritePrimeNumbers: [Int]
}
