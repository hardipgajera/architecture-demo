//
//  AppState.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import Foundation
import Combine

class Store<Value, Action>: ObservableObject {
    
    let reducer: (inout Value, Action) -> Void
    @Published var value: Value
    
    init(value: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = value
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&value, action)
    }
    
}

enum AppAction {
    case counterAction(CounterAction)
    case favouriteAction(FavouriteAction)
}

enum CounterAction {
    case incr
    case decr
}

enum FavouriteAction {
    case add
    case remove
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

