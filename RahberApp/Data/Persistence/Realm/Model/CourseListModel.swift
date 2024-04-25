import Foundation
import RealmSwift

public class CourseListModel: Object {
    @Persisted(primaryKey: true) var userID: Int
    @Persisted var name: String
    @Persisted var surname: String
    @Persisted var courses: List<CourseModel>

    public convenience init(entity: CoursesResponse) {
        self.init()
        self.userID = entity.userId
        self.name = entity.name
        self.surname = entity.surname
        self.courses.append(objectsIn: entity.leaderboard.map(CourseModel.init))
    }

}
