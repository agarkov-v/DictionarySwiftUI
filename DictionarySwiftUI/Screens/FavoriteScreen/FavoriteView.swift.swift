//
//  FavoriteView.swift.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 16.11.2021.
//

import SwiftUI

// MARK: TranslationView

struct FavoriteView: View {
	// MARK: - Public Properties

	// MARK: - Body

	var body: some View {
		NavigationView {
			ZStack {
				Color.bar.ignoresSafeArea()
					.allowsHitTesting(false)

				Group {
					if viewModel.definitions.isEmpty {
						emptySection
					} else {
						resultList
					}
				}
				.background(Color.background)
			}
			.onAppear {
				viewModel.loadLocalData()
			}
			.navigationBarTitle("FavoritesWords", displayMode: .inline)
		}
	}

	// MARK: - Init

	init(
		viewModel: StateObject<FavoriteViewModel> = StateObject(wrappedValue: FavoriteViewModel())
	) {
		_viewModel = viewModel
	}

	// MARK: - Private Properties

	@StateObject private var viewModel: FavoriteViewModel

	// MARK: Views

	private var emptySection: some View {
		EmptyDataView("EmptyFavorites")
			.frame(
				maxWidth: .infinity,
				maxHeight: .infinity
			)
			.foregroundColor(.gray)
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
			.onDelete { indexSet in
				viewModel.removeFromFavorites(indexSet)
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

// MARK: - Preview

#if DEBUG
struct FavoriteView_Previews: PreviewProvider {
	static var previews: some View {
		let favoriteView = FavoriteView()
		Group {
			favoriteView
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			favoriteView
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
				.environment(\.locale, Locale.init(identifier: "ru"))
		}
	}
}
#endif
