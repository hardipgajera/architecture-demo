//
//  CounterView.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import SwiftUI

struct CounterView: View {
    
    @StateObject var state: AppState
    @State private var showIsPrimeAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            HStack {
                Button { state.count -= 1 } label: {
                    Text("-")
                }
                Text("\(state.count)")
                Button { state.count += 1 } label: {
                    Text("+")
                }
            }
            Button { self.showIsPrimeAlert = true } label: {
                Text("Is this prime?")
            }
            Spacer()
            Button {
                
                if let index = state.favouritePrimeNumbers.firstIndex(of: state.count) {
                    state.favouritePrimeNumbers.remove(at: index)
                } else {
                    state.favouritePrimeNumbers.append(state.count)
                }
            } label: {
                if state.favouritePrimeNumbers.contains(state.count) {
                    Text("Remove \(state.count) to the favourite prime")
                } else {
                    Text("Add \(state.count) to the favourite prime")
                }
            }
            .padding(.bottom)
        }.alert("", isPresented: $showIsPrimeAlert) { } message: {
            if isPrime(state.count) {
                Text("\(state.count) is prime number.")
            } else {
                Text("\(state.count) is not prime number.")
            }
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}
