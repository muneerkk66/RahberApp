//
//  RahberAppApp.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import SwiftUI

@main
struct RahberApp: App {

    init() {

        Resolver.shared.injectModules()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView().onAppear {
                NetworkMonitor.shared.startMonitoring()
            }
        }
    }
}
