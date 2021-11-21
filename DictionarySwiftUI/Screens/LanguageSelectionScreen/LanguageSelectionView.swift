//
//  LanguageSelectionView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.09.2021.
//

import SwiftUI

// MARK: LanguageSelectionView

struct LanguageSelectionView: View {
	// MARK: - Public properties

	@Binding var selectedLanguage: Language

	// MARK: - Body

	var body: some View {
		VStack(spacing: .zero) {
			Text("ChooseLanguage")
				.font(Font.system(size: 20.0))
				.padding()
			listView
		}
		.background(Color.background)
		.navigationTitle("ChooseLanguage")
	}

	// MARK: - Private properties

	@Environment(\.presentationMode) private var presentationMode
	private let languages: [Language] = Language.allCases

	// MARK: - Views

	private var listView: some View {
		List {
			ForEach(languages, id: \.self) { language in
				Button {
					selectedLanguage = language
					presentationMode.wrappedValue.dismiss()
				} label: {
					LanguageCell(language: language.fullName.localized, isSelected: language == selectedLanguage)
				}
				.accentColor(Color.primary)
			}
			.listRowBackground(Color.cell)
		}
		.listStyle(.grouped)
		.onAppear {
			UITableView.appearance().backgroundColor = UIColor.clear
		}
	}
}

// MARK: Previews

#if DEBUG
struct LanguageSelection_Previews: PreviewProvider {
	static var previews: some View {
		let languageSelectionView = LanguageSelectionView(selectedLanguage: .constant(.russian))

		Group {
			languageSelectionView
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			languageSelectionView
				.environment(\.locale, Locale.init(identifier: "ru"))
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
		}
	}
}
#endif
