//
//  Provider.swift
//  DictionaryWidgetExtension
//
//  Created by Vyacheslav Agarkov on 28.10.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {

	// MARK: There should be an AppSorage there, but I don't have a developer account.
	var definitions: [DefinitionItem] = TranslationResponse.mockDefinitionsData

	func placeholder(in context: Context) -> WidgetEntry {
		WidgetEntry(definitions: definitions)
	}

	func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
			let entry = WidgetEntry(date: Date(), definitions: definitions)
			completion(entry)
		}

	}

	func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> Void) {
		var entries: [WidgetEntry] = []

		// Generate a timeline consisting of five entries an hour apart, starting from the current date.
		let currentDate = Date()
		for hourOffset in 0 ..< 1 {
			let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
			let entry = WidgetEntry(date: entryDate, definitions: definitions)
			entries.append(entry)
		}

		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
}
