//
//  Array+SafeIndex.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 20.08.2021.
//

import Foundation

extension Array {
	public subscript(safeIndex index: Int) -> Element? {
		guard index >= 0, index < endIndex else {
			return nil
		}

		return self[index]
	}
}
