//
//  TranslationItemMO+Filling.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation

extension TranslationItemManagedObject {
	// MARK: - Public Methods

	func fill(with translationItem: TranslationItem) {
		position = translationItem.position
		text = translationItem.text

		insertExamples(translationItem.examples)
		insertMeanings(translationItem.meanings)
		insertSynonyms(translationItem.synonyms)
	}

	// MARK: - Private Methods

	private func insertExamples(_ examples: [ExampleItem]?) {
		examples?.enumerated().forEach {
			guard let managedObjectContext = managedObjectContext else { return }
			let exampleItemMO = ExampleItemManagedObject(context: managedObjectContext)
			exampleItemMO.fill(with: $1)
			insertIntoExamples(exampleItemMO, at: $0)
		}
	}

	private func insertMeanings(_ meanings: [MeaningItem]?) {
		meanings?.enumerated().forEach {
			guard let managedObjectContext = managedObjectContext else { return }
			let meaningItemMO = MeaningItemManagedObject(context: managedObjectContext)
			meaningItemMO.fill(with: $1)
			insertIntoMeanings(meaningItemMO, at: $0)
		}
	}

	private func insertSynonyms(_ synonyms: [SynonymItem]?) {
		synonyms?.enumerated().forEach {
			guard let managedObjectContext = managedObjectContext else { return }
			let synonymItemMO = SynonymItemManagedObject(context: managedObjectContext)
			synonymItemMO.fill(with: $1)
			insertIntoSynonyms(synonymItemMO, at: $0)
		}
	}
}
