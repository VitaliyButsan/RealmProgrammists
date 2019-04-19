//
//  RealmCommunicator.swift
//  RealmToRelease
//
//  Created by vit on 4/18/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmCommunicator {
    
    static let realm = try! Realm()
    static var items: Results<Programmist>!
    
    // save one obj to db
    static func saveProgrammistToDB(withProgrammist programmist: Programmist) {
        let newProgrammist = Programmist()
        newProgrammist.name = programmist.name
        newProgrammist.age = programmist.age
        newProgrammist.workYears = programmist.workYears
        newProgrammist.haveLinesOfCode = programmist.haveLinesOfCode

        try! realm.write {
            realm.add(newProgrammist)
        }
    }
    
    // read all fields from db
    static func getAllProgrammistsFromDB() -> [Programmist] {
        var storageProgrammists = [Programmist]()
        
        let programmersFromDB = realm.objects(Programmist.self)
        for proger in programmersFromDB {
            storageProgrammists.append(proger)
        }
        return storageProgrammists
    }
    
    // get objects via name
    static func getProgrammistWithNameFromDB(withName name: String) -> [Programmist] {
        var programmistsWithCommonName = [Programmist]()
        
        let predicate = NSPredicate(format: "name BEGINSWITH %@", "\(name)")
        items = realm.objects(Programmist.self).filter(predicate)
        for proger in items {
            programmistsWithCommonName.append(proger)
        }
        
        return programmistsWithCommonName
    }
    
    // delete one obj from db
    static func deleteOneProgrammistFromDB(programmist: Programmist) {
        try! realm.write {
            realm.delete(programmist)
        }
    }
    
    // delete all objects from db
    static func deleteAllProgrammistsFromDB() {
        try! realm.write {
            realm.deleteAll()
            print("REALM HAS BEEN CLEANED!")
        }
    }
    
}
