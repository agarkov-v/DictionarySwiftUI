//
//  TranslationViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import Foundation
import Combine

class TranslationViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var searchText = "" {
        didSet {
            let searchState: State = isSearchInProgress ? .searchInProgress : .search
            state = searchText.isEmpty ? .local : searchState
            performSearch()
        }
    }
    
    @Published var selectedDefinition: DefinitionItem?
    
    // MARK: - Private Properties
    
    @Published private(set) var definitions: [DefinitionItem] = []
    private(set) var state: State = .local
    
    private let definitionInteractor: DefinitionInteractorProtocol
    private let dataService: DataService
    private var isSearchInProgress = false
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(
        definitionInteractor: DefinitionInteractorProtocol = InteractorLayer.shared.definitionInteractor,
        dataService: DataService = DataService.shared
    ) {
        self.definitionInteractor = definitionInteractor
        self.dataService = dataService
    }
    
    // MARK: - Public Methods
    
    func loadLocalData() {
        switch state {
        case .local:
            definitions = definitionInteractor.getAll()
            
        default:
            return
        }
    }
    
    func onDeleteItem(at indexSet: IndexSet) {
        indexSet.forEach {
            definitionInteractor.deleteFromFavourites(definitions[$0])
        }
        definitions.remove(atOffsets: indexSet)
        loadLocalData()
    }
    
    // MARK: - Private Methods
    
    private func performSearch() {
        guard
            !searchText.isEmpty
        else {
            loadLocalData()
            return
        }
        let filteredItems = definitions.filter { $0.text.contains(searchText) }
        if !filteredItems.isEmpty {
            definitions = filteredItems
        } else {
            performSearchRequest(searchText)
        }
    }
    
    private func performSearchRequest(_ text: String) {
        cancellable.removeAll()
        
        dataService.requestTranslation(for: text)
            .receive(on: DispatchQueue.main) // RunLoop.main
            .throttle(
                for: .milliseconds(500),
                   scheduler: DispatchQueue.main,
                   latest: true
            )
            .handleEvents(
                receiveSubscription: { [weak self] _ in
                    guard let self = self else { return }
                    self.isSearchInProgress = true
                    self.state = .searchInProgress
                }, receiveCompletion: { [weak self] _ in
                    guard let self = self else { return }
                    self.isSearchInProgress = false
                    self.state = .search
                }
            )
            .sink(
                receiveCompletion: { error in
                    debugPrint("receiveCompletion: \(error)")
                    switch error {
                    case .failure(let failError):
                        debugPrint("search error: \(failError.localizedDescription) | \(failError)")
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    self.definitions = response.definition
                }
            )
            .store(in: &cancellable)
    }
}

// MARK: - Enum

extension TranslationViewModel {
     enum State {
        case local
        case searchInProgress
        case search
    }
}
