//
//  TheComposableArchitectureApp.swift
//  TheComposableArchitecture
//
//  Created by Ahmed Ali on 02/03/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct TheComposableArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: State(),
                    reducer: reduce,
                    environment: Environment())
            )
        }
    }
}
