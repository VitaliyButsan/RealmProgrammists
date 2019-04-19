//
//  DataModel.swift
//  RealmToRelease
//
//  Created by vit on 4/18/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation
import RealmSwift

class Programmist: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var workYears = 0
    @objc dynamic var haveLinesOfCode = 0
}
