//
//  PersonEntity.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//

import Foundation

class PersonEntity: CoreDataEntity {
    internal let object: PersonData
    
    required init(object: PersonData? = nil) {
        if let object = object {
            self.object = object
        } else {
            let object = PersonData.newEmpty()
            self.object = object
        }
    }
    
    var name: String {
        get {
            object.name
        }
        set {
            object.name = newValue
        }
    }
    
    var age: Int {
        get {
            Int(object.age)
        }
        set {
            object.age = Int16(newValue)
        }
    }
}
