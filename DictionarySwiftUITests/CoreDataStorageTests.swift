//
//  CoreDataStorageTests.swift
//  DictionarySwiftUITests
//
//  Created by Vyacheslav Agarkov on 21.10.2021.
//

import XCTest
import CoreData
@testable import DictionarySwiftUI

class CoreDataStorageTests: XCTestCase {
	func testPersistentStoreSQLiteSetup() {
		let service = CoreDataStorage()
		let stores = service.persistentContainer.persistentStoreCoordinator.persistentStores

		XCTAssertEqual(stores.first?.type, NSSQLiteStoreType)
	}

	func testPersistentStoreInMemorySetup() {
		let service = CoreDataStorage(storeType: NSInMemoryStoreType)
		let stores = service.persistentContainer.persistentStoreCoordinator.persistentStores

		XCTAssertEqual(stores.first?.type, NSInMemoryStoreType)
	}

	func testRootContextType() {
		let service = CoreDataStorage()

		XCTAssertEqual(service.mainContext.concurrencyType, .mainQueueConcurrencyType)
	}
}
