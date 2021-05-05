//
//  PersonData+CoreDataClass.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//
//

import Foundation
import CoreData

@objc(Person)
public class PersonData: NSManagedObject {
    override class var coreDataName: String {
        "Person"
    }
}
