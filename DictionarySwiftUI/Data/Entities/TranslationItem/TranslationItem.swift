//
//  TranslationItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct TranslationItem: Codable, Hashable {
	let text: String
	let position: String?
	let synonyms: [SynonymItem]?
	let meanings: [MeaningItem]?
	let examples: [ExampleItem]?

	enum CodingKeys: String, CodingKey {
		case text = "text"
		case position = "pos"
		case synonyms = "syn"
		case meanings = "mean"
		case examples = "ex"
	}
}

extension TranslationItem {
	static func fill(with translationItemMO: TranslationItemManagedObject) -> TranslationItem {
		let synonymItemMOs = translationItemMO.synonyms?.array as? [SynonymItemManagedObject]
		let synonymsArr = synonymItemMOs?.map {
			SynonymItem.fill(with: $0)
		}
		let synonyms = (synonymsArr ?? []).isEmpty ? nil : synonymsArr

		let meaningItemMOs = translationItemMO.meanings?.array as? [MeaningItemManagedObject]
		let meaningsArr = meaningItemMOs?.map {
			MeaningItem.fill(with: $0)
		}
		let meanings = (meaningsArr ?? []).isEmpty ? nil : meaningsArr

		let exampleItemMOs = translationItemMO.examples?.array as? [ExampleItemManagedObject]
		let examplesArr = exampleItemMOs?.map {
			ExampleItem.fill(with: $0)
		}
		let examples = (examplesArr ?? []).isEmpty ? nil : examplesArr

		let translationItem = TranslationItem(
			text: translationItemMO.text,
			position: translationItemMO.position,
			synonyms: synonyms,
			meanings: meanings,
			examples: examples
		)

		return translationItem
	}
}
