//
//  SearchHeaderView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

// MARK: - SearchHeaderView

struct SearchHeaderView: View {
	// MARK: - Public Properties

	@Binding var searchText: String

	// MARK: - Body

	var body: some View {
		VStack(spacing: .zero) {
			languageButtons
			HStack(spacing: .zero) {
				searchTextView
				if searchText.isEmpty {
					searchImageView
				} else {
					clearButtonView
				}
			}
		}
		.padding(.bottom, 8)
	}

	// MARK: - Init

	init(
		searchText: Binding<String>,
		isLanguageChanged: Binding<Bool>
	) {
		_searchText = searchText
		_viewModel = StateObject(wrappedValue: SearchHeaderViewModel(isLanguageChanged: isLanguageChanged))
	}

	// MARK: - Private Properties

	@StateObject private var viewModel: SearchHeaderViewModel
	@State private var isFromButtonTapped = false
	@State private var isToButtonTapped = false

	// MARK: - Views

	private var languageButtons: some View {
		HStack(spacing: .zero) {
			Button(viewModel.translateFromLanguage.fullName.localized) {
				isFromButtonTapped.toggle()
			}
			.accessibilityIdentifier("translateFromLanguageButton")
			.frame(
				maxWidth: .infinity,
				maxHeight: 44
			)
			.font(
				Font.system(size: 17, weight: .semibold)
			)
			.sheet(
				isPresented: $isFromButtonTapped,
				content: {
					LanguageSelectionView(selectedLanguage: $viewModel.translateFromLanguage)
				}
			)

			switchLanguagesButtonView

			Button(viewModel.translateToLanguage.fullName.localized) {
				isToButtonTapped.toggle()
			}
			.accessibilityIdentifier("translateToLanguageButton")
			.frame(
				maxWidth: .infinity,
				maxHeight: 44
			)
			.font(
				Font.system(size: 17, weight: .semibold)
			)
			.sheet(
				isPresented: $isToButtonTapped,
				content: {
					LanguageSelectionView(selectedLanguage: $viewModel.translateToLanguage)
				}
			)
		}
	}

	private var switchLanguagesButtonView: some View {
		Button {
			viewModel.switchLanguages()
		} label: {
			Image(systemName: "arrow.left.arrow.right")
				.frame(width: 44, height: 44)
		}
		.accessibilityIdentifier("switchLanguagesButton")
	}

	private var searchTextView: some View {
		TextField(
			LocalizedStringKey("Searching"),
			text: $searchText
		)
			.accessibilityIdentifier("searchTextField")
			.textFieldStyle(MainTextFieldStyle(backroundColor: Color.background))
			.padding(.leading, 5)
	}

	private var searchImageView: some View {
		Image(systemName: "magnifyingglass")
			.renderingMode(.template)
			.foregroundColor(Color.gray)
			.frame(width: 44, height: 44)
	}

	private var clearButtonView: some View {
		Button {
			searchText = ""
		} label: {
			Image(systemName: "xmark.circle")
				.frame(width: 44, height: 44)
		}
		.accessibilityIdentifier("clearButton")
	}
}

// MARK: Previews

#if DEBUG
struct SearchHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		let searchHeaderView = SearchHeaderView(
			searchText: .constant(""),
			isLanguageChanged: .constant(false)
		)

		Group {
			searchHeaderView
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			searchHeaderView
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")

			searchHeaderView
				.environment(\.locale, Locale.init(identifier: "ru"))
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
				.previewDisplayName("Ru")
		}
	}
}
#endif
