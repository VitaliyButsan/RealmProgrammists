//
//  ProgrammistCommunicator.swift
//  RealmToRelease
//
//  Created by vit on 4/18/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation

class ProgrammistViewModel {
    
    var programmistsWithNameArray = [Programmist]()
    var allProgrammists = [Programmist]()
    
    
    // add new programmist
    func createProgrammist(withProgrammist oneObject: Programmist) {
        RealmCommunicator.saveProgrammistToDB(withProgrammist: oneObject)
    }
    
    // get programmists with name
    func getProgrammistsWithName(withName name: String) {
        programmistsWithNameArray = RealmCommunicator.getProgrammistWithNameFromDB(withName: name)
    }
    
    // delete programmist with name
    func deleteOneProgrammist(programmist: Programmist) {
        RealmCommunicator.deleteOneProgrammistFromDB(programmist: programmist)
    }
    
    // get all programmists
    func getAllProgrammists() {
        allProgrammists = RealmCommunicator.getAllProgrammistsFromDB()
    }
    
    // delete All(!) programmists
    func deleteAllProgrammists() {
        RealmCommunicator.deleteAllProgrammistsFromDB()
    }
    
}
