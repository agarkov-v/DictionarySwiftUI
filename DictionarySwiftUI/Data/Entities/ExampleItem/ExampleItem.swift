//
//  ExampleItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct ExampleItem: Codable, Hashable {
    
    let text : String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}

extension ExampleItem {
    
    static func fill(with exampleItemMO: ExampleItemManagedObject) -> ExampleItem {
        ExampleItem(text: exampleItemMO.text)
    }
}
