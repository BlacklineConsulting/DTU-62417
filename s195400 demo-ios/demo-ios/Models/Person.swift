import Foundation
import RealmSwift
import SwiftyJSON

class Person: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
    let hasKids = RealmOptional<Bool>()
    let numberOfCars = RealmOptional<Int>()
    let totalHoursWorkingMonthly = RealmOptional<Float>()
    let montlySalary = RealmOptional<Double>()
    
    let animals = List<Animal>()
    
    let kids = List<Kids>()
    
    class func load(realm: Realm, id: String) -> Person? {
        return realm.objects(Person.self).first(where: { $0.id == id })
    }
    
    class func parseAndPersist(json: JSON, realm: Realm) -> Person {
        let dic = json.dictionaryObject! // TODO: handle optional?
        return realm.create(Person.self, value: dic, update: .all)
    }
}

/*
 2a: Save a new person to Realm. I added a new person on the file Persons.json because I don't see how else to do add, because when I open db.realm file the file is empty perhaps because there is no realm.add() in ShowCaseController?
 
 
 
 */
