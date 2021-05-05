//
//  PersonData+CoreDataProperties.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//
//

import Foundation
import CoreData

extension PersonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonData> {
        return NSFetchRequest<PersonData>(entityName: Self.coreDataName)
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int16

}
