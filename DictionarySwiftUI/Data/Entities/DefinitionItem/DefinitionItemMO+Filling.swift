//
//  DefinitionItemMO+Filling.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation

extension DefinitionItemManagedObject {
	func toDomain() -> DefinitionItem {
		let translationItemMOs = translations.array as? [TranslationItemManagedObject]

		let translations = translationItemMOs?.compactMap {
			TranslationItem.fill(with: $0)
		} ?? []

		let definitionItem = DefinitionItem(
			text: text,
			position: position,
			translations: translations
		)
		return definitionItem
	}

	func fill(with definition: DefinitionItem) {
		id = definition.id
		position = definition.position
		text = definition.text

		definition.translations.enumerated().forEach { index, translation in
			let translationItemMO = TranslationItemManagedObject(context: managedObjectContext!)
			translationItemMO.fill(with: translation)
			insertIntoTranslations(translationItemMO, at: index)
		}
	}
}
