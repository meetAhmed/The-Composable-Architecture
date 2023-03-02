//
//  AddToCartButton.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import ComposableArchitecture
import SwiftUI

struct AddToCartButton: View {
    let store: Store<AddToCartDomain.State, AddToCartDomain.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.counter > 0 {
                PlusMinusButton(store: store)
            } else {
                Button {
                    viewStore.send(.didTapPlusButton)
                } label: {
                    Text("Add To Cart")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(
            store: Store(
                initialState: AddToCartDomain.State(),
                reducer: AddToCartDomain.reducer,
                environment: AddToCartDomain.Environment())
        )
    }
}
