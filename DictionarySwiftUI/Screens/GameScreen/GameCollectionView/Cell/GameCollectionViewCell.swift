//
//  GameCollectionViewCell.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.10.2021.
//

import UIKit
import SwiftUI

final class GameCollectionViewCell: UICollectionViewCell {
	// MARK: - Private Properties

	private var titleLabel = UILabel()

	// MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupAppearance()
		setupLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Public Methods

	private func setupAppearance() {
		titleLabel.numberOfLines = 0

		contentView.layer.cornerRadius = 10
		contentView.backgroundColor = UIColor(Color.cell)
	}

	private func setupLayout() {
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)

		NSLayoutConstraint.activate([
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10),
			titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
			titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10)
		])
	}

	// MARK: - Private Methods

	func setup(_ item: DefinitionItem) {
		titleLabel.text = item.text
	}
}
