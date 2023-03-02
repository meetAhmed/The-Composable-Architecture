//
//  AddToCartDomain.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import ComposableArchitecture

struct AddToCartDomain {
    struct State: Equatable {
        var counter = 0
    }

    enum Action: Equatable {
        case didTapMinuButton
        case didTapPlusButton
    }

    struct Environment {
        
    }
    
    static let reducer = AnyReducer<State, Action, Environment> { state, action, env in
        switch action {
        case .didTapMinuButton:
            state.counter -= 1
            return EffectTask.none
        case .didTapPlusButton:
            state.counter += 1
            return EffectTask.none
        }
    }
}
