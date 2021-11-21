//
//  DictionaryWidgetEntryView.swift
//  DictionaryWidgetExtension
//
//  Created by Vyacheslav Agarkov on 28.10.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct DictionaryWidgetEntryView: View {
	// MARK: - Public Properties

	// MARK: Body

	var body: some View {
		ZStack {
			Color("background")
				.ignoresSafeArea()
				.allowsHitTesting(false)

			switch widgetFamily {
			case .systemSmall:
				smallView
			default:
				mediumView
			}
		}
	}

	// MARK: - Init

	init(entry: Provider.Entry) {
		viewModel = WidgetEntryViewModel(entry)
	}

	// MARK: - Private Properties

	@Environment(\.widgetFamily) private var widgetFamily

	private var viewModel: WidgetEntryViewModel

	// MARK: Vies

	private var smallView: some View {
		Text(viewModel.randomEntry?.text ?? "NoResults")
			.font(Font.system(size: 25))
	}

	private var mediumView: some View {
		VStack(spacing: .zero) {
			let randomDefinition = viewModel.randomEntry
			Text(randomDefinition?.text ?? "NoResults")
				.font(Font.system(size: 20))

			Divider()
				.padding(.bottom, 5)

			Text(randomDefinition?.translationString ?? "NoTranslation")
				.font(Font.system(size: 12))
				.padding(.leading, 5)
		}
	}
}
