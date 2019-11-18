import Foundation
import RealmSwift
import RxSwift

class ShowCaseController {
    static func run() {
        _ = PersonsAPI.get()
            .subscribeOn(ConcurrentDispatchQueueScheduler.background)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { (json) in
                print("RxSwift onNext: \(json)")
                
                let realm = Realm.create()
                
                // Create
                let personsJson = json["persons"]
                
                // Persist
                realm.safeWrite() {
                    let persons = personsJson.arrayValue.map({ Person.parseAndPersist(json: $0, realm: realm) })
                    
                    persons.forEach {
                        debugPrint("Saved: \($0.firstName) \($0.lastName) with animals: \(Array($0.animals.map({ $0.name }))) with kids: \(Array($0.kids.map({ $0.firstName })))")
                        
                    }
                }
                
            }, onError: { (error) in
                print("RxSwift onError: \(error)")
                
            }, onCompleted: {
                print("RxSwift onCompleted")
                
            }, onDisposed: {
                print("RxSwift onDisposed")
            })
    }
}
