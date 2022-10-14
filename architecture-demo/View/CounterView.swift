//
//  CounterView.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import SwiftUI

struct CounterView: View {
    
    @StateObject var state: Store<AppState, AppAction>
    @State private var showIsPrimeAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            HStack {
                Button { state.send(.counterAction(.decr)) } label: {
                    Text("-")
                }
                Text("\(state.value.count)")
                Button { state.send(.counterAction(.incr)) } label: {
                    Text("+")
                }
            }
            Button { self.showIsPrimeAlert = true } label: {
                Text("Is this prime?")
            }
            Spacer()
            Button {
                
                if let _ = state.value.favouritePrimeNumbers.firstIndex(of: state.value.count) {
                    state.send(.favouriteAction(.remove))
                } else {
                    state.send(.favouriteAction(.add))
                }
            } label: {
                if state.value.favouritePrimeNumbers.contains(state.value.count) {
                    Text("Remove \(state.value.count) to the favourite prime")
                } else {
                    Text("Add \(state.value.count) to the favourite prime")
                }
            }
            .padding(.bottom)
        }.alert("", isPresented: $showIsPrimeAlert) { } message: {
            if isPrime(state.value.count) {
                Text("\(state.value.count) is prime number.")
            } else {
                Text("\(state.value.count) is not prime number.")
            }
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}
