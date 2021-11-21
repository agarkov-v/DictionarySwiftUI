//
//  TranslationResponse.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct TranslationResponse: Codable {
	let definition: [DefinitionItem]

	enum CodingKeys: String, CodingKey {
		case definition = "def"
	}
}

// MARK: EmptyResponse

extension TranslationResponse {
	static let emptyResponse = TranslationResponse(definition: [])
}
