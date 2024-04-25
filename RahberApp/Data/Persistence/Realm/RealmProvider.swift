//
//  RealmProvider.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.

import Foundation
@preconcurrency import RealmSwift

@globalActor actor BackgroundActor: GlobalActor {
    static var shared = BackgroundActor()
}
actor RealmProvider {
    static var shared = BackgroundActor()
    private var  realm: Realm?

    func realm() async -> Realm? {
        if realm == nil {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            realm = try? await Realm(configuration: config, actor: BackgroundActor.shared)
        }

        return realm
    }
}
