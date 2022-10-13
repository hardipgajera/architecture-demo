//
//  FavouritePrimeView.swift
//  architecture-demo
//
//  Created by macbook on 13/10/22.
//

import SwiftUI

struct FavouritePrimeView: View {
    
    @Binding var state: FavouriteAppState
    
    var body: some View {
        List {
            ForEach(state.favouritePrimeNumbers, id: \.self) { prime in
                Text("\(prime)")
            }
        }
    }
}
