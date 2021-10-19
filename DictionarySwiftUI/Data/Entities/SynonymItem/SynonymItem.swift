//
//  SynonymItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct SynonymItem: Codable, Hashable {
    
    let text : String
    let position: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case position = "pos"
    }
}

extension SynonymItem {
    
    static func fill(with synonymItemMO: SynonymItemManagedObject) -> SynonymItem {
        SynonymItem(
            text: synonymItemMO.text,
            position: synonymItemMO.position
        )
    }
}
