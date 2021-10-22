//
//  DefinitionCDStorageService.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.09.2021.
//

import Foundation
import CoreData

protocol DefinitionCDStorageServiceProtocol {
    var mainContext: NSManagedObjectContext { get }

    func hasDefinition(with id: String) -> Bool
    func addDefinition(_ definition: DefinitionItem)
    func deleteDefinition(with id: String)
    func fetchAllDefenitions() -> [DefinitionItemManagedObject]
	func deleteAllDefinitions()
}

class DefinitionCDStorageService: DefinitionCDStorageServiceProtocol {

    // MARK: - Public Properties

    var mainContext: NSManagedObjectContext {
        coreDataStorage.mainContext
    }


    // MARK: - Private Properties

    private let coreDataStorage: CoreDataStorageProtocol


    // MARK: - Init

    init(coreDataStorage: CoreDataStorageProtocol = CoreDataStorage()) {
        self.coreDataStorage = coreDataStorage
    }


    // MARK: - Public Methods

    func hasDefinition(with id: String) -> Bool {
        guard let definitions = fetchDefinitions(with: id) else { return false }
        return definitions.count == 1
    }

    func addDefinition(_ definition: DefinitionItem) {
        let definitionMO = DefinitionItemManagedObject(context: coreDataStorage.mainContext)
        definitionMO.fill(with: definition)
        coreDataStorage.saveContext()
    }

    func deleteDefinition(with id: String) {
        guard let definition = fetchDefinitions(with: id) else { return }
        definition.forEach { coreDataStorage.mainContext.delete($0) }
        coreDataStorage.saveContext()
    }
	
	func deleteAllDefinitions() {
		let defenitions = fetchAllDefenitions()
		defenitions.forEach {
			deleteDefinition(with: $0.id)
		}
	}
    
    func fetchAllDefenitions() -> [DefinitionItemManagedObject] {
        let request: NSFetchRequest<DefinitionItemManagedObject> = DefinitionItemManagedObject.fetchRequest()
        do {
            return try coreDataStorage.mainContext.fetch(request)
        } catch {
            return []
        }
    }


    // MARK: - Private Methods

    private func fetchDefinitions(with id: String) -> [DefinitionItemManagedObject]? {
        let request: NSFetchRequest<DefinitionItemManagedObject> = DefinitionItemManagedObject.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        var fetchedObjects: [DefinitionItemManagedObject] = []

        do {
            fetchedObjects = try coreDataStorage.mainContext.fetch(request)
        } catch {
            return nil
        }

        return fetchedObjects
    }
}
