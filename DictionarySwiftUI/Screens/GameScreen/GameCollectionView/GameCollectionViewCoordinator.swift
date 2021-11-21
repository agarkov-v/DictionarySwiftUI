//
//  GameCollectionViewCoordinator.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 18.10.2021.
//

import SwiftUI

class GameCollectionViewCoordinator: NSObject {
	// MARK: - Public Properties

	var collectionView: UICollectionView?

	@Binding var isCellTapped: Bool
	@Binding var selectedCellIndex: Int?

	// MARK: - Private Properties

	private var parent: GameCollectionView

	private let collectionPaddingInset: CGFloat = 20
	private let minimumCollectionLineSpacing: CGFloat = 10
	private let minimumCollectionInteritemSpacing: CGFloat = 5

	// MARK: - Init

	init(
		_ gameCollectionView: GameCollectionView,
		isCellTapped: Binding<Bool>,
		selectedCellIndex: Binding<Int?>
	) {
		parent = gameCollectionView
		_isCellTapped = isCellTapped
		_selectedCellIndex = selectedCellIndex
	}

	// MARK: - Private Methods

	private func cellSize(for numberOfCellsInRow: Int) -> CGFloat {
		let minInteritemSpacing = minimumCollectionInteritemSpacing * CGFloat((numberOfCellsInRow - 1))
		let totalSpacing = collectionPaddingInset * 2 + minInteritemSpacing
		let cellSize = ((collectionView?.bounds.width ?? UIScreen.main.bounds.width) - totalSpacing) / CGFloat(numberOfCellsInRow)
		return cellSize
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GameCollectionViewCoordinator: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		let cellSize = cellSize(for: 3)
		return CGSize(width: cellSize, height: cellSize)
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		insetForSectionAt section: Int
	) -> UIEdgeInsets {
		UIEdgeInsets(
			top: collectionPaddingInset,
			left: collectionPaddingInset,
			bottom: collectionPaddingInset,
			right: collectionPaddingInset
		)
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumLineSpacingForSectionAt section: Int
	) -> CGFloat {
		minimumCollectionLineSpacing
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumInteritemSpacingForSectionAt section: Int
	) -> CGFloat {
		minimumCollectionInteritemSpacing
	}
}

// MARK: - UICollectionViewDataSource

extension GameCollectionViewCoordinator: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		parent.definitionItems.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard
			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: GameCollectionViewCell.reuseIdentifier,
				for: indexPath
			) as? GameCollectionViewCell
		else {
			return UICollectionViewCell()
		}

		let item = parent.definitionItems[indexPath.row]
		cell.setup(item)

		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension GameCollectionViewCoordinator: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		isCellTapped.toggle()
		selectedCellIndex = indexPath.row
	}
}
