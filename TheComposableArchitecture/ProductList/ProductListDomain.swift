//
//  ProductListDomain.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import ComposableArchitecture
import Foundation

struct ProductListDomain {
    struct State: Equatable {
        var productList: IdentifiedArray<ProductDomain.State.ID, ProductDomain.State> = []
    }
    
    enum Action: Equatable {
        case fetchProducts
        case fetchProductResponse(TaskResult<[Product]>)
        case product(id: ProductDomain.State.ID, action: ProductDomain.Action)
    }
    
    struct Environment {
        var fetchProducts: () async throws -> [Product]
    }
    
    static let reducer = AnyReducer<State, Action, Environment>.combine(
        ProductDomain.reducer.forEach(
            state: \.productList,
            action: /Action.product(id:action:),
            environment: { _ in
                ProductDomain.Environment()
            }
        ),
        .init { state, action, env in
            switch action {
            case .fetchProducts:
                return EffectTask.task {
                    await .fetchProductResponse(TaskResult {
                        try await env.fetchProducts()
                    })
                }
            case .fetchProductResponse(.success(let products)):
                state.productList = IdentifiedArray(
                    uniqueElements: products.map { ProductDomain.State(id: UUID(), product: $0) }
                )
                return .none
            case .fetchProductResponse(.failure(let error)):
                return .none
            case .product(_, _):
                return .none
            }
        })
}
