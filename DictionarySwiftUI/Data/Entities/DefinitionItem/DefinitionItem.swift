//
//  DefinitionItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct DefinitionItem: Codable, Identifiable, Hashable {
	var id: String {
		let translations = translations.compactMap { $0.text }
		let id = text + (position ?? "") + translations.joined()
		return id
	}
	let text: String
	let position: String?
	let translations: [TranslationItem]

	enum CodingKeys: String, CodingKey {
		case text = "text"
		case position = "pos"
		case translations = "tr"
	}
}

extension DefinitionItem {
	var translationString: String {
		let translations = translations.map {
			$0.text
		}
		let translationsString = translations.joined(separator: ", ")
		return translationsString
	}

	static func fill(with definitionItemMO: DefinitionItemManagedObject) -> DefinitionItem {
		// swiftlint:disable force_cast
		let translations = definitionItemMO.translations.compactMap {
			TranslationItem.fill(with: $0 as! TranslationItemManagedObject)
		}
		// swiftlint:enable force_cast

		let definitionItem = DefinitionItem(
			text: definitionItemMO.text,
			position: definitionItemMO.position,
			translations: translations
		)

		return definitionItem
	}
}
