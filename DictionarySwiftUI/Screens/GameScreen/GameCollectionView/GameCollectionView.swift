//
//  GameCollectionView.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.10.2021.
//

import SwiftUI

struct GameCollectionView: UIViewRepresentable {
	typealias UIViewType = UICollectionView

	// MARK: - Public Properties

	@Binding var definitionItems: [DefinitionItem]
	@Binding var isCellTapped: Bool
	@Binding var selectedCellIndex: Int?

	// MARK: - Public Methods

	func makeUIView(context: Context) -> UICollectionView {
		let layout = UICollectionViewFlowLayout()
		let inset: CGFloat = 20
		layout.sectionInset = UIEdgeInsets(
			top: inset,
			left: inset,
			bottom: inset,
			right: inset
		)

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = .clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false

		collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)

		collectionView.dataSource = context.coordinator
		collectionView.delegate = context.coordinator
		context.coordinator.collectionView = collectionView
		return collectionView
	}

	func updateUIView(_ uiView: UICollectionView, context: Context) {
		uiView.reloadData()
	}

	func makeCoordinator() -> GameCollectionViewCoordinator {
		GameCollectionViewCoordinator(
			self,
			isCellTapped: _isCellTapped,
			selectedCellIndex: _selectedCellIndex
		)
	}
}
