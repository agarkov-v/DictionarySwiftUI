//
//  SearchViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var translateFromLanguage: Language {
        didSet {
            dataService.userSettings.fromLanguage = translateFromLanguage
        }
    }
    
    @Published var translateToLanguage: Language {
        didSet {
            dataService.userSettings.toLanguage = translateToLanguage
        }
    }
    
    // MARK: - Private Properties
    
    private let dataService: DataService
    
    // MARK: - Init
    
    init(
        dataService: DataService = DataService.shared
    ) {
        self.dataService = dataService
        translateFromLanguage = dataService.userSettings.fromLanguage
        translateToLanguage = dataService.userSettings.toLanguage
    }
}
