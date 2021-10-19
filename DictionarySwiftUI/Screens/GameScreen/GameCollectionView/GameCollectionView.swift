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
        //        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(
            top: 10,
            left: 10,
            bottom: 10,
            right: 10
        )
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
        
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
//        collectionView.isUserInteractionEnabled = true
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
