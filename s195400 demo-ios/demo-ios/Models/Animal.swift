import Foundation
import RealmSwift

class Animal: Object {
    override static func primaryKey() -> String? {
        return "id"
    }

    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
}
