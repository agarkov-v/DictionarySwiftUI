//
//  DefinitionItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct DefinitionItem: Codable, Identifiable  {
    
    var id: String {
        text + (translations.first?.text ?? "") + (position ?? "")
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
