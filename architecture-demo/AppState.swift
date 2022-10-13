//
//  AppState.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import Foundation
import Combine

class Store<Value>: ObservableObject {
    @Published var value: Value
    
    init(value: Value) {
        self.value = value
    }
}

struct AppState {
    var count: Int = 0
    var favouritePrimeNumbers: [Int] = []
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
