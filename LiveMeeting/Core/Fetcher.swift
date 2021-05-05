//
//  Fetcher.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//

import CoreData
import Foundation

class Fetcher<ManagedObject: NSManagedObject> {
    typealias ManagedObject = NSManagedObject
    
    private let fetchController: NSFetchedResultsController<ManagedObject>
    
    var items: [ManagedObject] {
        fetchController.fetchedObjects ?? []
    }
    
    init(predicate: NSPredicate? = nil, sort: [String]? = nil, ascending: Bool = true) {
        let fetchRequest = NSFetchRequest<ManagedObject>(entityName: ManagedObject.coreDataName)

        if let sort = sort {
            fetchRequest.sortDescriptors = sort.map { NSSortDescriptor(key: $0, ascending: ascending) }
        } else {
            fetchRequest.sortDescriptors = []
        }
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        
        fetchController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.currentContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetch()
    }
    
    convenience init(uuid: String, sort: [String]? = nil, ascending: Bool = true) {
        let predicate = NSPredicate(format: "uuid == %@", uuid)
        self.init(predicate: predicate, sort: sort, ascending: ascending)
    }
    
    func fetch() {
        do {
            try fetchController.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
    func add() -> ManagedObject {
        let newEmpty = ManagedObject.newEmpty()
        fetch()
        return newEmpty
    }
    
    func removeLast() {
        fetchController.fetchedObjects?.last?.remove()
        fetch()
    }
    
    func removeAll() {
        fetchController.fetchedObjects?.forEach { $0.remove() }
        fetch()
    }
}
