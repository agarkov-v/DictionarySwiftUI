//
//  ExampleItemMO+Filling.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.11.2021.
//

import Foundation

extension ExampleItemManagedObject {
	func fill(with exampleItem: ExampleItem) {
		text = exampleItem.text
	}
}
