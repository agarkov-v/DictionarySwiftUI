//
//  MainView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.08.2021.
//

import SwiftUI

// MARK: - MainTabView

struct MainTabView: View {
	// MARK: - Body

	var body: some View {
		TabView(selection: $viewModel.mainNavigation.selectedTab) {
			favoriteView
			searchView
			gameView
		}
		.onAppear(perform: UIApplication.shared.addEndEditingTapGestureRecognizer)
		.accentColor(Color.mainAccent)
		.environmentObject(viewModel.mainNavigation)
	}

	// MARK: - Init

	init(
		viewModel: StateObject<MainViewModel> = StateObject(wrappedValue: MainViewModel())
	) {
		_viewModel = viewModel
	}

	// MARK: - Private Properties

	@StateObject private var viewModel: MainViewModel

	private var favoriteView: some View {
		return FavoriteView()
			.tabItem {
				Label(
					"FavoritesMain",
					systemImage: "star.fill"
				)
			}
			.tag(TabItems.favorite)
	}

	private var searchView: some View {
		return SearchView()
			.tabItem {
				Label(
					"SearchMain",
					systemImage: "magnifyingglass"
				)
			}
			.tag(TabItems.search)
	}

	private var gameView: some View {
		return GameView()
			.tabItem {
				Label(
					"GameMain",
					systemImage: "gamecontroller"
				)
			}
			.tag(TabItems.game)
	}
}

// MARK: - Preview

#if DEBUG
struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			MainTabView()
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			MainTabView()
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
		}
	}
}
#endif
