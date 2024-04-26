//
//  RahberAppApp.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

@main
struct RahberAppApp: App {

    init() {

        Resolver.shared.injectModules()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}
