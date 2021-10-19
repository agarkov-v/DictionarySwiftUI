//
//  TranslationDetailViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 08.10.2021.
//

import Foundation

class TranslationDetailViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var definitionItem: DefinitionItem
    @Published var isFavorite = false
    
    // MARK: - Private Properties
    
    private let definitionInteracror: DefinitionInteractorProtocol
    
    // MARK: - Init
    
    init(
        definitionItem: DefinitionItem,
        definitionInteracror: DefinitionInteractorProtocol = InteractorLayer.shared.definitionInteractor
    ) {
        self.definitionItem = definitionItem
        self.definitionInteracror = definitionInteracror
        
        isFavorite = definitionInteracror.isSavedToFavourites(definitionItem)
    }
    
    func onFavoriteButtonTap() {
        if isFavorite {
            definitionInteracror.deleteFromFavourites(definitionItem)
        } else {
            definitionInteracror.addToFavourites(definitionItem)
        }
        isFavorite = definitionInteracror.isSavedToFavourites(definitionItem)
    }
}
