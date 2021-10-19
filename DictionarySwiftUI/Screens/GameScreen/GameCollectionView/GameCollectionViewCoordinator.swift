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
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GameCollectionViewCoordinator: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
}

// MARK: - UICollectionViewDataSource

extension GameCollectionViewCoordinator: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        parent.definitionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.reuseIdentifier, for: indexPath) as! GameCollectionViewCell
        
        let item = parent.definitionItems[indexPath.row]
        cell.setup(item)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension GameCollectionViewCoordinator: UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("|| tap")
//        let post = self.parent.dataSearch[indexPath.item]
//        parent.didSelectItem(indexPath)
//        parent.didSelectObject(post)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCellTapped.toggle()
        selectedCellIndex = indexPath.row
    }
}
