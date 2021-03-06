//
//  CoreDataManager.swift
//  LiveMeeting
//
//  Created by Oleksii Lytvynov-Bohdanov on 05.05.2021.
//

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private let domain = "CoreDataManagerDomain"
    
    lazy var persistentContainer: NSPersistentContainer = {
        let momdName = "LiveMeeting"
        guard let modelURL = Bundle(for: type(of: self)).url(forResource: momdName, withExtension:"momd") else {
                fatalError("Error loading model from bundle")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let container = NSPersistentContainer(name: "LiveMeetingDataModel", managedObjectModel:managedObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        DispatchQueue.main.async { [weak self] in
            guard let context = self?.persistentContainer.viewContext else { return }
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }
    
    static var currentContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
}
