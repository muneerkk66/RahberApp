//
//  CoursesLocalDataSource.swift
//  RahberApp
//
//  Created by Muneer K K on 25/04/2024.
//

import Foundation

protocol CoursesLocalDataSource {
    func fetchAllCourses() async -> CourseListModel?
    func saveAllCourses(_ object: CourseListModel) async
}

final class CoursesLocalDataSourceLive: CoursesLocalDataSource {

    private let realmProvider: RealmProvider

    init(realmProvider: RealmProvider) {
        self.realmProvider = realmProvider
    }

    @BackgroundActor
    func fetchAllCourses() async -> CourseListModel? {
        guard let storage = await realmProvider.realm() else { return nil }
        return storage.objects(CourseListModel.self).first
    }

    @BackgroundActor
    func saveAllCourses(_ object: CourseListModel) async {
        guard let storage = await realmProvider.realm() else { return }
        storage.writeAsync {
            storage.add(object, update: .all)
        }
    }
}
