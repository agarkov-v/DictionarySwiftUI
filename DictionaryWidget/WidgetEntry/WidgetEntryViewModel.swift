//
//  WidgetEntryViewModel.swift
//  DictionaryWidgetExtension
//
//  Created by Vyacheslav Agarkov on 28.10.2021.
//

import WidgetKit

class WidgetEntryViewModel {
	// MARK: - Public Properties

	var randomEntry: DefinitionItem? {
		entry.definitions.randomElement()
	}

	// MARK: - Private Properties

	private var entry: Provider.Entry

	// MARK: - Init

	init(_ entry: Provider.Entry) {
		self.entry = entry
	}
}
