//
//  SearchViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
	// MARK: - Public Properties

	@Published var searchText = "" {
		didSet {
			let searchState: State = isSearchInProgress ? .searchInProgress : .searched
			state = searchText.isEmpty ? .empty : searchState
			performSearch()
		}
	}

	@Published var isLanguageChanged: Bool = false {
		didSet {
			searchText = ""
		}
	}

	// MARK: - Private Properties

	@Published private(set) var definitions: [DefinitionItem] = []
	private(set) var state: State = .empty

	private weak var dataService: DataService?
	private var isSearchInProgress = false
	private var cancellable = Set<AnyCancellable>()

	// MARK: - Init

	init(
		dataService: DataService = DataService.shared
	) {
		self.dataService = dataService
	}

	// MARK: - Private Methods

	private func performSearch() {
		guard
			!searchText.isEmpty
		else {
			definitions.removeAll()
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

		dataService?.requestTranslation(for: text)
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
					self.state = .searched
				}
			)
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case .failure(let failError):
#if DEBUG
						debugPrint("search error: \(failError.localizedDescription) | \(failError)")
#endif
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

extension SearchViewModel {
	enum State {
		case empty
		case searchInProgress
		case searched
	}
}
