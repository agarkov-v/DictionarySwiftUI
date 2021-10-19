//
//  DefinitionItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct DefinitionItem: Codable, Identifiable, Hashable  {
    
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
    
//    static func fill(with definitionItemMO: DefinitionItemManagedObject) -> DefinitionItem {
//
//        let translationItemMOs = definitionItemMO.translations.array as? [TranslationItemManagedObject]
//
//        let translations = translationItemMOs?.compactMap {
//            TranslationItem.fill(with: $0)
//        }
//
//        let definitionItem = DefinitionItem(
//            text: definitionItemMO.text,
//            position: definitionItemMO.position,
//            translations: translations ?? []
//        )
//
//        return definitionItem
//    }
    
    static func fill(with definitionItemMO: DefinitionItemManagedObject) -> DefinitionItem {
        
        let translations = definitionItemMO.translations.compactMap {
            TranslationItem.fill(with: $0 as! TranslationItemManagedObject)
        }
        
        let definitionItem = DefinitionItem(
            text: definitionItemMO.text,
            position: definitionItemMO.position,
            translations: translations 
        )
        
        return definitionItem
    }
}
