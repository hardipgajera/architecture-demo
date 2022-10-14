//
//  AppReducer.swift
//  architecture-demo
//
//  Created by macbook on 15/10/22.
//

import Foundation

let appReducer = combine(counterReducer,favouriteActionReducer)

func combine<Value, Action>(
    _ reducers: ((inout Value, Action) -> Void)...
) -> ((inout Value, Action) -> Void) {
    return { value, action in
        for reducer in reducers {
            reducer(&value, action)
        }
    }
}

func counterReducer(store: inout AppState, action: AppAction) {
    switch action {
    case .counterAction(let counterAction):
        switch counterAction {
        case .incr:
            store.count += 1
        case .decr:
            store.count -= 1
        }
    default:
        break
    }
}

func favouriteActionReducer(store: inout AppState, action: AppAction) {
    switch action {
    case .favouriteAction(let favouriteAction):
        switch favouriteAction {
        case .add:
            store.favouriteAppState.favouritePrimeNumbers.append(store.count)
        case .remove:
            if let index = store.favouriteAppState.favouritePrimeNumbers.firstIndex(of: store.count) {
                store.favouriteAppState.favouritePrimeNumbers.remove(at: index)
            }
        }
    default:
        break
    }
}
