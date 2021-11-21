//
//  LanguageCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

// MARK: - LanguageCell

struct LanguageCell: View {
	// MARK: - Body

	var body: some View {
		HStack(spacing: .zero) {
			Text(languageString)
			Spacer()
			Image(systemName: "checkmark")
				.isHidden(!isSelected)
				.foregroundColor(Color.mainAccent)
		}
	}

	// MARK: Public Properties

	let languageString: String
	let isSelected: Bool

	init(
		language: String,
		isSelected: Bool = false
	) {
		self.languageString = language
		self.isSelected = isSelected
	}
}

// MARK: - Preview

#if DEBUG
struct LanguageCell_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			LanguageCell(language: "English")
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")
				.previewLayout(.sizeThatFits)

			LanguageCell(language: "English", isSelected: true)
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
				.previewLayout(.sizeThatFits)
		}
	}
}
#endif
