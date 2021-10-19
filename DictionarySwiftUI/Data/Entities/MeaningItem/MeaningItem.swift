//
//  MeaningItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct MeaningItem: Codable, Hashable {
    
    let text : String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}

extension MeaningItem {
    
    static func fill(with meaningItemMO: MeaningItemManagedObject) -> MeaningItem {
        MeaningItem(text: meaningItemMO.text)
    }
}
