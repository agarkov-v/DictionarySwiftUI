//
//  GameViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.10.2021.
//

import Foundation

class GameViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var definitions: [DefinitionItem] = [] {
        didSet {
            guard definitions.isEmpty else { return }
            isCellTapped = false
        }
    }
    @Published var isCellTapped = false
    @Published var selectedCellIndex: Int?
    
    var selectedDefinition: DefinitionItem? {
        guard let selectedCellIndex = selectedCellIndex else { return nil }
        return definitions[safeIndex: selectedCellIndex]
    }
    
    // MARK: - Private Properties
    
    private let definitionInteractor: DefinitionInteractorProtocol
    
    // MARK: - Init
    
    init(
        definitionInteractor: DefinitionInteractorProtocol = InteractorLayer.shared.definitionInteractor
    ) {
        self.definitionInteractor = definitionInteractor
    }
    
    // MARK: - Public Methods
    
    func loadLocalData() {
        definitions = definitionInteractor.getAll()
    }
}

