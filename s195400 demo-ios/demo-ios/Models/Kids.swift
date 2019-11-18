//
//  Kids.swift
//  demo-ios
//
//  Created by Arif Yildirim on 18/11/2019.
//  Copyright © 2019 OverallApps IVS. All rights reserved.
//

import Foundation
import RealmSwift

class Kids: Object {
    override static func primaryKey() -> String? {
        return "id"
    }

    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
}
