//
//  UIApplication+EndEditingTapGestureRecognizer.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 17.11.2021.
//

import UIKit

extension UIApplication {
	func addEndEditingTapGestureRecognizer() {
		guard let window = windows.first else { return }
		let endEditingTapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
		endEditingTapGesture.requiresExclusiveTouchType = false
		endEditingTapGesture.cancelsTouchesInView = false
		endEditingTapGesture.delegate = self
		window.addGestureRecognizer(endEditingTapGesture)
	}
}

extension UIApplication: UIGestureRecognizerDelegate {
	public func gestureRecognizer(
		_ gestureRecognizer: UIGestureRecognizer,
		shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
	) -> Bool {
		return false
	}
}
