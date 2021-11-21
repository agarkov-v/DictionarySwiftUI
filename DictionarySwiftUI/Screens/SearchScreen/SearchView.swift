//
//  SearchView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 07.09.2021.
//

import SwiftUI

// MARK: SearchView

struct SearchView: View {
	// MARK: - Public Properties

	// MARK: - Body

	var body: some View {
		NavigationView {
			ZStack {
				Color.bar.ignoresSafeArea()
					.allowsHitTesting(false)

				VStack(spacing: .zero) {
					Group {
						if viewModel.definitions.isEmpty {
							emptySection
						} else {
							resultList
						}
					}
					.background(Color.background)

					searchHeaderView
				}
			}
			.navigationBarTitle("SearchTitle", displayMode: .inline)
		}
	}

	// MARK: - Init

	init(
		viewModel: StateObject<SearchViewModel> = StateObject(wrappedValue: SearchViewModel())
	) {
		_viewModel = viewModel
	}

	// MARK: - Private Properties

	@StateObject private var viewModel: SearchViewModel

	// MARK: Views

	private var emptySection: some View {
		Group {
			switch viewModel.state {
			case .empty:
				EmptyDataView("EmptySearch")

			case .searched:
				Text("NoResults")

			case .searchInProgress:
				ProgressView()
			}
		}
		.frame(
			maxWidth: .infinity,
			maxHeight: .infinity
		)
		.foregroundColor(.gray)
	}

	private var searchHeaderView: some View {
		SearchHeaderView(
			searchText: $viewModel.searchText,
			isLanguageChanged: $viewModel.isLanguageChanged
		)
	}

	private var resultList: some View {
		List {
			ForEach(viewModel.definitions) { definition in
				ZStack {
					NavigationLink {
						TranslationDetailView(definitionItem: definition)
					} label: {
						EmptyView()
					}

					TranslationCell(translation: definition)
				}
			}
			.listRowBackground(Color.cell)
		}
		.padding(.top, -20)
		.onAppear {
			UITableView.appearance().backgroundColor = UIColor.clear
			UITableView.appearance().separatorInset = UIEdgeInsets.zero
		}
	}
}

// MARK: Previews

#if DEBUG
struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		let searchView = SearchView()
		Group {
			searchView
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			searchView
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
				.environment(\.locale, Locale.init(identifier: "ru"))
		}
	}
}
#endif
