//
//  GameView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 11.09.2021.
//

import SwiftUI

// MARK: GameView

struct GameView: View {
	// MARK: - Public Properties

	// MARK: - Body

	var body: some View {
		NavigationView {
			ZStack {
				Color.bar.ignoresSafeArea()
					.allowsHitTesting(false)
				navigationLink

				Group {
					if viewModel.definitions.isEmpty {
						emptyDataView
					} else {
						gameCollectionView
					}
				}
				.background(Color.background)
				.navigationBarTitle("CheckMemory", displayMode: .inline)
			}
		}
		.onAppear {
			viewModel.loadLocalData()
		}
	}

	// MARK: - Init

	init(
		viewModel: StateObject<GameViewModel> = StateObject(wrappedValue: GameViewModel())
	) {
		_viewModel = viewModel
	}

	// MARK: - Private Properties

	@StateObject private var viewModel: GameViewModel

	// MARK: Views

	private var titleView: some View {
		Text("CheckMemory")
			.font(
				Font.system(size: 25, weight: .semibold)
			)
	}

	private var emptyDataView: some View {
		EmptyDataView("EmptyGame")
			.frame(
				maxWidth: .infinity,
				maxHeight: .infinity
			)
			.foregroundColor(.gray)
	}

	private var gameCollectionView: some View {
		GameCollectionView(
			definitionItems: $viewModel.definitions,
			isCellTapped: $viewModel.isCellTapped,
			selectedCellIndex: $viewModel.selectedCellIndex
		)
	}

	private var navigationLink: some View {
		NavigationLink(
			isActive: $viewModel.isCellTapped
		) {
			viewModel.selectedDefinition.map {
				GameDetailView(definitionItem: $0)
			}
		} label: {
			EmptyView()
		}
	}
}

// MARK: Previews

#if DEBUG
struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			GameView()
				.preferredColorScheme(.light)
				.previewDisplayName("Defult")

			GameView()
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark Mode")
				.environment(\.locale, Locale.init(identifier: "ru"))
		}
	}
}
#endif
