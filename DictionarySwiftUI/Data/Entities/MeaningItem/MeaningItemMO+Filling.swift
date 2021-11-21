//
//  MeaningItemMO+Filling.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation

extension MeaningItemManagedObject {
	func fill(with meaningItem: MeaningItem) {
		text = meaningItem.text
	}
}
