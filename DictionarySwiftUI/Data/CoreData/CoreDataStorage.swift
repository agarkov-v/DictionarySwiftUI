//
//  CoreDataStorage.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.09.2021.
//

import Foundation
import CoreData

protocol CoreDataStorageProtocol {
    var mainContext: NSManagedObjectContext { get }
    func saveContext()
}

class CoreDataStorage: CoreDataStorageProtocol {

    // MARK: - Public Properties

    public lazy var mainContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = self.rootBackgroundContext
        return context
    }()


    // MARK: - Private Properties

    private var storeType: String

    internal lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DictionarySwiftUI")
        let description = container.persistentStoreDescriptions.first
        description?.type = storeType
        description?.shouldAddStoreAsynchronously = false
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        return container
    }()

    private lazy var rootBackgroundContext: NSManagedObjectContext = {
        let context = self.persistentContainer.newBackgroundContext()
        return context
    }()


    // MARK: - Init

    init(storeType: String = NSSQLiteStoreType) {
        self.storeType = storeType
    }


    // MARK: - Public Methods

    public func saveContext() {
        if self.mainContext.hasChanges {
            mainContext.performAndWait {
                do {
                    try self.mainContext.save()
                    self.rootBackgroundContext.perform {
                        do {
                            try self.rootBackgroundContext.save()
                        } catch {
                            fatalError("Failure to save context: \(error)")
                        }
                    }
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
            }
        }
    }
}
