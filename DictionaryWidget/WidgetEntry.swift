//
//  WidgetEntry.swift
//  DictionaryWidgetExtension
//
//  Created by Vyacheslav Agarkov on 28.10.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct WidgetEntry: TimelineEntry {
	
	let date: Date
	let definitions: [DefinitionItem]

	init(
		date: Date = Date(),
		definitions: [DefinitionItem]
	) {
		self.date = date
		self.definitions = definitions
	}
}
