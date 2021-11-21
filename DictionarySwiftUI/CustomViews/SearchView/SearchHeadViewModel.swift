//
//  SearchHeaderViewModel.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

class SearchHeaderViewModel: ObservableObject {
	// MARK: - Public Properties

	@Published var translateFromLanguage: Language {
		didSet {
			dataService?.userSettings.fromLanguage = translateFromLanguage
			isLanguageChanged.toggle()
		}
	}

	@Published var translateToLanguage: Language {
		didSet {
			dataService?.userSettings.toLanguage = translateToLanguage
			isLanguageChanged.toggle()
		}
	}

	@Binding var isLanguageChanged: Bool

	// MARK: - Private Properties

	private weak var dataService: DataService?

	// MARK: - Init

	init(
		isLanguageChanged: Binding<Bool>,
		dataService: DataService = DataService.shared
	) {
		_isLanguageChanged = isLanguageChanged
		self.dataService = dataService
		translateFromLanguage = dataService.userSettings.fromLanguage
		translateToLanguage = dataService.userSettings.toLanguage
	}

	func switchLanguages() {
		let fromLangugage = translateFromLanguage
		translateFromLanguage = translateToLanguage
		translateToLanguage = fromLangugage
	}
}
