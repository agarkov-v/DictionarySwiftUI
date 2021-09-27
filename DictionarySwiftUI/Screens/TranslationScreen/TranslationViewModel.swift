//
//  TranslationViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import Foundation
import SwiftUI

class TranslationViewModel: ObservableObject {
    
    @Published var translations: [DefinitionItem] = []
    
    init() {
        // fetch DB
    }
    
}
