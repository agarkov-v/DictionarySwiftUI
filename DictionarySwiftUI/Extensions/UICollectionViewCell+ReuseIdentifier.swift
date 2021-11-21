//
//  UICollectionViewCell+ReuseIdentifier.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.10.2021.
//

import UIKit

extension UICollectionViewCell {
	class var reuseIdentifier: String {
		return String(describing: self)
	}
}
