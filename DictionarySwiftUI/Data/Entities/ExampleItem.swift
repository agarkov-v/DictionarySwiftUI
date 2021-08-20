//
//  ExampleItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct ExampleItem: Codable {
    
    let text : String
    let translations: [TranslationItem]?

    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case translations = "tr"
    }
}
