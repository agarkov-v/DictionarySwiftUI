//
//  SynonymItemMO+Filling.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation

extension SynonymItemManagedObject {
	func fill(with synonymItem: SynonymItem) {
		position = synonymItem.position
		text = synonymItem.text
	}
}
