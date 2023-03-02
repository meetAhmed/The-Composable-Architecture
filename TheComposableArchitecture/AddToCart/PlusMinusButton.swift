//
//  PlusMinusButton.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import ComposableArchitecture
import SwiftUI

struct PlusMinusButton: View {
    let store: Store<AddToCartDomain.State, AddToCartDomain.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Button {
                    viewStore.send(.didTapMinuButton)
                } label: {
                    Text("-")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Text(viewStore.state.counter.description)
                
                Button {
                    viewStore.send(.didTapPlusButton)
                } label: {
                    Text("+")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct PlusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusMinusButton(
            store: Store(
                initialState: AddToCartDomain.State(),
                reducer: AddToCartDomain.reducer,
                environment: AddToCartDomain.Environment())
        )
    }
}
