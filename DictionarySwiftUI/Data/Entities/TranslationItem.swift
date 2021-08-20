//
//  TranslationItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct TranslationItem: Codable {
    
    let text : String
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
