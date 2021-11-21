//
//  FavoriteViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 16.11.2021.
//

import Foundation

class FavoriteViewModel: ObservableObject {
	// MARK: - Private Properties

	@Published private(set) var definitions: [DefinitionItem] = []

	private let definitionInteractor: DefinitionInteractorProtocol

	// MARK: - Init

	init(
		definitionInteractor: DefinitionInteractorProtocol = DefinitionInteractor()
	) {
		self.definitionInteractor = definitionInteractor
	}

	// MARK: - Public Methods

	func loadLocalData() {
		definitions = definitionInteractor.getAll()
	}

	func removeFromFavorites(_ indexSet: IndexSet) {
		indexSet.forEach {
			definitionInteractor.deleteFromFavourites(definitions[$0])
		}
		definitions.remove(atOffsets: indexSet)
	}
}
