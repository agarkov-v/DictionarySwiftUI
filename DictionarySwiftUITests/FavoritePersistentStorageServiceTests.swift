//
//  FavoritePersistentStorageServiceTests.swift
//  DictionarySwiftUITests
//
//  Created by Vyacheslav Agarkov on 21.10.2021.
//

import XCTest
import CoreData
@testable import DictionarySwiftUI

class FavoritePersistentStorageServiceTests: XCTestCase {
    
    var storageService: DefinitionCDStorageService!
    let definition = TranslationResponse.friendMockData.definition.first!
    
    override func setUp() {
        super.setUp()
        let coreDataStorage = CoreDataStorage(storeType: NSInMemoryStoreType)
        storageService = DefinitionCDStorageService(coreDataStorage: coreDataStorage)
    }
    
    override func tearDown() {
        storageService = nil
        super.tearDown()
    }
    
    func addObjectToStorage() {
        storageService.addDefinition(definition)
    }
    
    func testCheckingEmptyStorageForObjects() {
        XCTAssertFalse(storageService.hasDefinition(with: definition.id))
    }
    
    func testCheckingFilledStorageforObjects() {
        addObjectToStorage()
        XCTAssertTrue(storageService.hasDefinition(with: definition.id))
    }
    
    func testFetchingAllObjects() {
        addObjectToStorage()
        let fetchedDefenitions = storageService.fetchAllDefenitions()
        XCTAssertEqual(fetchedDefenitions.count, 1)
    }
    
    func testDeleteAllObjects() {
        let addExpectation = expectation(description: "addExpectation")
        addExpectation.isInverted = true
        
        testFetchingAllObjects()
        
        waitForExpectations(timeout: 0.5, handler: nil)
        
        storageService.deleteAllDefinitions()
        let defenitionAfterDelete = storageService.fetchAllDefenitions()
        
        XCTAssertEqual(defenitionAfterDelete.count, 0)
    }
    
    func testAddingAndFetchingPairs() {
        addObjectToStorage()
        storageService.deleteDefinition(with: definition.id)
        XCTAssertFalse(storageService.hasDefinition(with: definition.id))
    }
    
}
