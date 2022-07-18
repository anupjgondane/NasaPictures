//
//  PersistantStorage.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import CoreData

class PersistantStorage {
    
    static let shared = PersistantStorage()
    
    private init() {}

    // MARK: - Core Data stack
    
    private lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NasaPictures")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        return self.context
    }
    
    func save() {
        self.saveContext()
    }

}
