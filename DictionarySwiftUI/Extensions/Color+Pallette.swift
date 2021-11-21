//
//  Color+Pallette.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

extension Color {
	static let background = Color(
		UIColor {
			return $0.userInterfaceStyle == .dark ? UIColor(Color(hex: "#3F3F45")) : UIColor(Color(hex: "#F2F2F7"))
		}
	)

	static let cell = Color(
		UIColor {
			return $0.userInterfaceStyle == .dark ? UIColor(Color(hex: "#353540")) : UIColor(Color(hex: "#ffffff"))
		}
	)

	static let bar = Color(
		UIColor {
			return $0.userInterfaceStyle == .dark ? UIColor(Color(hex: "#2F2E32")) : UIColor(Color(hex: "#ffffff"))
		}
	)

	static let mainAccent = Color(hex: "#316CDC")

	static let secondaryGray = Color(
		UIColor {
			return $0.userInterfaceStyle == .dark ? UIColor(Color(hex: "#414148")) : UIColor(Color(hex: "#CDCDCF"))
		}
	)
}
