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

final class CoreDataStorage: CoreDataStorageProtocol {
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
		container.loadPersistentStores { [weak self] (_, error) in
			guard let self = self else { return }
			if let error = error as NSError? {
				// self.deleteData(container)
				// self.deleteAllData(container)
//				 self.resetAllData(container)
				assertionFailure("Unresolved error \(error), \(error.userInfo)")
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
		guard self.mainContext.hasChanges else { return }
		mainContext.performAndWait { [unowned self] in
			do {
				try self.mainContext.save()
				self.rootBackgroundContext.perform {
					do {
						try self.rootBackgroundContext.save()
					} catch {
						assertionFailure("Failure to save context: \(error)")
					}
				}
			} catch {
				assertionFailure("Failure to save context: \(error)")
			}
		}
	}

	private func deleteData(_ container: NSPersistentContainer) {
		guard let persistentStore = container.persistentStoreCoordinator.persistentStores.first else { return }

		let url = container.persistentStoreCoordinator.url(for: persistentStore)

		mainContext.performAndWait { () -> Void in
			mainContext.reset()
			do {
				try container.persistentStoreCoordinator.remove(persistentStore)
				try FileManager.default.removeItem(at: url)

				try container.persistentStoreCoordinator.destroyPersistentStore(
					at: url,
					ofType: persistentStore.description,
					options: nil
				)

				//				try container.persistentStoreCoordinator.addPersistentStore(
				//					ofType: persistentStore.description,
				//					configurationName: nil,
				//					at: url,
				//					options: nil
				//				)

				container.loadPersistentStores(completionHandler: { (_, error) in
					if let error = error as NSError? {
						assertionFailure("Unresolved error \(error), \(error.userInfo)")
					}
				})
			} catch {
				assertionFailure("Failure to delete persistentStore: \(error)")
			}
		}
	}

	private func resetAllData(_ container: NSPersistentContainer) {
		let coordinator = container.persistentStoreCoordinator

		rootBackgroundContext.performAndWait { () -> Void in
			rootBackgroundContext.reset()
			coordinator.persistentStores.forEach {
				do {
					guard let url = $0.url else { return }
					try coordinator.destroyPersistentStore(
						at: url,
						ofType: $0.type,
						options: nil
					)
					try FileManager.default.removeItem(at: url)
				} catch {
					assertionFailure("Failure to delete persistentStore: \(error)")
				}
			}

			container.loadPersistentStores { _, error in
				if let error = error as NSError? {
					assertionFailure("Unresolved error \(error), \(error.userInfo)")
				}
			}
		}
	}

	private func deleteAllData(_ container: NSPersistentContainer) {
		let persistentStores = container.persistentStoreCoordinator.persistentStores

		persistentStores.forEach { persistentStore in
			let url = container.persistentStoreCoordinator.url(for: persistentStore)

			mainContext.performAndWait { () -> Void in
				mainContext.reset()
				do {
					try container.persistentStoreCoordinator.remove(persistentStore)
					try FileManager.default.removeItem(at: url)

					try container.persistentStoreCoordinator.destroyPersistentStore(
						at: url,
						ofType: persistentStore.description,
						options: nil
					)

//					try container.persistentStoreCoordinator.addPersistentStore(
//						ofType: persistentStore.description,
//						configurationName: nil,
//						at: url,
//						options: nil
//					)
//
//					container.loadPersistentStores(completionHandler: { (_, error) in
//						if let error = error as NSError? {
//							assertionFailure("Unresolved error \(error), \(error.userInfo)")
//						}
//					})
				} catch {
					assertionFailure("Failure to delete persistentStore: \(error)")
				}
			}
		}
	}
}
