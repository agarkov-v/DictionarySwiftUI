//
//  MeaningItem.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

struct MeaningItem: Codable {
    
    let text : String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}
