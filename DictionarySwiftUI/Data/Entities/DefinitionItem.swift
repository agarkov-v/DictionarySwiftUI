//
//  DefinitionItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct DefinitionItem: Codable {
    
    let text: String
    let position: String?
    let translations: [TranslationItem]
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case position = "pos"
        case translations = "tr"
    }
}
