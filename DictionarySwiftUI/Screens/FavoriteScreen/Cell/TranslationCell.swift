//
//  TranslationCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: TranslationCell

struct TranslationCell: View {
	let translation: DefinitionItem

	var body: some View {
		HStack {
			let inset: CGFloat = 5
			Text("\(translation.text)")
				.frame(maxWidth: .infinity)
				.padding(.all, inset)

			Rectangle()
				.fill(Color.secondaryGray)
				.frame(width: 1)

			Text("\(translation.translations.first?.text ?? "NoTranslation")")
				.frame(maxWidth: .infinity)
				.padding(.all, inset)
		}
		.fixedSize(horizontal: false, vertical: true)
	}
}

// MARK: Previews

#if DEBUG
struct TranslationCell_Previews: PreviewProvider {
	static var previews: some View {
		let mock = MockHelper.petMockData.definition.first!
		let translationCell = TranslationCell(translation: mock)

		Group {
			translationCell
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			translationCell
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
		}
	}
}
#endif
