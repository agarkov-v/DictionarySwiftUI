//
//  GameDetailViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 19.10.2021.
//

import Foundation

class GameDetailViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var definitionItem: DefinitionItem
    @Published var translationText: String = "" {
        didSet {
            if translationText.isEmpty {
                isButtonTapped = false
            }
        }
    }
    @Published var isTranslationCorrect = false
    @Published var isButtonTapped = false
    
    // MARK: - Init
    
    init(
        definition: DefinitionItem
    ) {
        definitionItem = definition
    }
    
    // MARK: - Public Methods
    
    func compareTranslation() {
        isButtonTapped = true
        let isCompate = definitionItem.translations.contains {
            $0.text.lowercased() == translationText.lowercased()
        }
        
        print("|| isCompate: \(isCompate)")
        
        isTranslationCorrect = isCompate
    }
}
