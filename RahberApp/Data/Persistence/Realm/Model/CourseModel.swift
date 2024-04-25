import Foundation
import RealmSwift

public class CourseModel: Object {
    @Persisted(primaryKey: true) var userID: Int
    @Persisted var name: String

    public convenience init(entity: CourseResponse) {
        self.init()
        self.userID = entity.courseId
        self.name = entity.name

    }

}
