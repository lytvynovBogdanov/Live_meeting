//
//  CoreDataEntity.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//

import CoreData
import Foundation

protocol CoreDataEntity {
    associatedtype ManagedObject where ManagedObject: NSManagedObject
    
    var object: ManagedObject { get }
    
    init(object: ManagedObject?)
    func delete()
}

extension CoreDataEntity {
    init(object: ManagedObject? = ManagedObject.newEmpty()) {
        self.init(object: object)
    }
    
    func delete() {
        object.remove()
    }
}
