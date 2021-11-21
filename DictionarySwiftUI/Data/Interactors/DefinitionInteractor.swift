//
//  DefinitionInteractor.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 30.09.2021.
//

import Foundation

protocol DefinitionInteractorProtocol {
	func addToFavourites(_ definition: DefinitionItem)
	func isSavedToFavourites(_ definition: DefinitionItem) -> Bool
	func deleteFromFavourites(_ definition: DefinitionItem)
	func getAll() -> [DefinitionItem]
	func deleteAll()
}

class DefinitionInteractor: DefinitionInteractorProtocol {
	// MARK: - Private Properties

	private let coreDataStorage: DefinitionCDStorageServiceProtocol

	// MARK: - Init

	init(
		coreDataStorage: DefinitionCDStorageServiceProtocol = DataService.shared.definitionCDStorageService
	) {
		self.coreDataStorage = coreDataStorage
	}

	// MARK: - Public Methods

	func addToFavourites(_ definition: DefinitionItem) {
		coreDataStorage.addDefinition(definition)
	}

	func isSavedToFavourites(_ definition: DefinitionItem) -> Bool {
		coreDataStorage.hasDefinition(with: definition.id)
	}

	func deleteFromFavourites(_ definition: DefinitionItem) {
		coreDataStorage.deleteDefinition(with: definition.id)
	}

	func getAll() -> [DefinitionItem] {
		let fetchedItems = coreDataStorage.fetchAllDefenitions()
		let items = fetchedItems.map { $0.toDomain() }
		return items
	}

	func deleteAll() {
		coreDataStorage.deleteAllDefinitions()
	}
}
