//
//  UINavigationController+DisplayMode.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 13.10.2021.
//

import UIKit

extension UINavigationController {
	override open func viewWillLayoutSubviews() {
		navigationBar.topItem?.backButtonDisplayMode = .minimal
	}
}
