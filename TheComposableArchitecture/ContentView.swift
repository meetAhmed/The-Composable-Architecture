//
//  ContentView.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import ComposableArchitecture
import SwiftUI

struct State: Equatable {
    var counter = 0
}

enum Action: Equatable {
    case increaseCounter
    case decreaseCounter
}

struct Environment {
    
}

let reduce = AnyReducer<State, Action, Environment> { state, action, env in
    switch action {
    case .decreaseCounter:
        state.counter -= 1
        return EffectTask.none
    case .increaseCounter:
        state.counter += 1
        return EffectTask.none
    }
}

struct ContentView: View {
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Button {
                    viewStore.send(.decreaseCounter)
                } label: {
                    Text("-")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Text(viewStore.state.counter.description)
                
                Button {
                    viewStore.send(.increaseCounter)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: State(),
                reducer: reduce,
                environment: Environment())
        )
    }
}
