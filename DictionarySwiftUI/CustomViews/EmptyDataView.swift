//
//  EmptyDataView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.10.2021.
//

import SwiftUI

// MARK: EmptyDataView

struct EmptyDataView: View {
	// MARK: - Properties

	// MARK: Body
	var body: some View {
		Text(text.localized)
			.multilineTextAlignment(.center)
	}

	private let text: String

	// MARK: - Init

	init(_ text: String) {
		self.text = text
	}
}

// MARK: Previews

#if DEBUG
struct EmptyDataView_Previews: PreviewProvider {
	static var previews: some View {
		let emptyDataView = EmptyDataView("EmptyFavorites")
		Group {
			emptyDataView
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			emptyDataView
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
				.environment(\.locale, Locale.init(identifier: "ru"))
				.previewDisplayName("Dark Mode")
		}
	}
}
#endif
