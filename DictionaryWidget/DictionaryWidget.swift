//
//  DictionaryWidget.swift
//  DictionaryWidget
//
//  Created by Vyacheslav Agarkov on 28.10.2021.
//

import WidgetKit
import SwiftUI
import Intents

// MARK: - DictionaryWidget

@main
struct DictionaryWidget: Widget {
	let kind: String = "DictionaryWidget"

	// MARK: - Body

	var body: some WidgetConfiguration {
		IntentConfiguration(
			kind: kind,
			intent: ConfigurationIntent.self,
			provider: Provider()
		) { entry in
			DictionaryWidgetEntryView(entry: entry)
		}
		.supportedFamilies([
			.systemSmall,
			.systemMedium
		])
		.configurationDisplayName("My Widget")
		.description("This is an example widget.")
	}
}

// MARK: - Previews

struct DictionaryWidget_Previews: PreviewProvider {
	static var previews: some View {
		let mock: [DefinitionItem] = MockHelper.mockDefinitionsData
		let dictionaryWidgetEntryView = DictionaryWidgetEntryView(entry: WidgetEntry(definitions: mock))
		Group {
			dictionaryWidgetEntryView
				.previewContext(WidgetPreviewContext(family: .systemSmall))
				.previewDisplayName("Small")

			dictionaryWidgetEntryView
				.previewContext(WidgetPreviewContext(family: .systemMedium))
				.preferredColorScheme(.light)
				.previewDisplayName("Medium light")

			dictionaryWidgetEntryView
				.previewContext(WidgetPreviewContext(family: .systemMedium))
				.preferredColorScheme(.dark)
				.environment(\.locale, Locale.init(identifier: "ru"))
				.previewDisplayName("Medium dark")
		}
	}
}
