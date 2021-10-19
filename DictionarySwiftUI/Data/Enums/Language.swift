//
//  Language.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    var id: Int {
        hashValue
    }
    
    case russian = "ru"
    case english = "en"
    case polish = "pl"
    case ukrainian = "uk"
    case german = "de"
    case french = "fr"
    case italian = "it"
    case spanish = "es"
    case turkish = "tr"
    
}
