//
//  NSManagedObject.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//

import CoreData

private extension NSObject {
    static var classString: String {
        String(describing: self.self)
    }
}

extension NSManagedObject {
    
    @objc
    class var coreDataName: String {
        Self.classString
    }
    
    @objc
    class func newEmpty(with context: NSManagedObjectContext = CoreDataManager.currentContext) -> Self {
        guard let entity = NSEntityDescription.entity(forEntityName: Self.coreDataName, in: context),
            let newObject = NSManagedObject(entity: entity, insertInto: context) as? Self else {
            fatalError("Failed to create \(Self.self)")
        }

        return newObject
    }
    
    func remove(with context: NSManagedObjectContext = CoreDataManager.currentContext) {
        context.delete(self)
    }
}
