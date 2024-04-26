import Foundation
import RealmSwift

public class CourseModel: Object {
    @Persisted(primaryKey: true) var courseId: Int
    @Persisted var name: String
    @Persisted var url: String
    @Persisted var duration: String
    @Persisted var tag: String
    @Persisted var category: Int

    public convenience init(entity: CourseResponse) {
        self.init()
        self.courseId = entity.courseId
        self.name = entity.name
        self.url = entity.url
        self.tag = entity.tag
        self.category = entity.category
        self.duration = entity.duration

    }

}
