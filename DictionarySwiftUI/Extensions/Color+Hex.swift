//
//  Color+Hex.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 05.10.2021.
//

import SwiftUI

extension Color {
	init(hex string: String) {
		var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		if string.hasPrefix("#") {
			_ = string.removeFirst()
		}

		// Double the last value if incomplete hex
		if !string.count.isMultiple(of: 2), let last = string.last {
			string.append(last)
		}

		// Fix invalid values
		if string.count > 8 {
			string = String(string.prefix(8))
		}

		// Scanner creation
		let scanner = Scanner(string: string)

		var color: UInt64 = 0
		scanner.scanHexInt64(&color)

		if string.count == 2 {
			let mask = 0xFF

			let grayMask = Int(color) & mask

			let gray = Double(grayMask) / 255.0

			self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
		} else if string.count == 4 {
			let mask = 0x00FF

			let grayMask = Int(color >> 8) & mask
			let alphaMask = Int(color) & mask

			let gray = Double(grayMask) / 255.0
			let alpha = Double(alphaMask) / 255.0

			self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
		} else if string.count == 6 {
			let mask = 0x0000FF
			let redMask = Int(color >> 16) & mask
			let greenMask = Int(color >> 8) & mask
			let blueMask = Int(color) & mask

			let red = Double(redMask) / 255.0
			let green = Double(greenMask) / 255.0
			let blue = Double(blueMask) / 255.0

			self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
		} else if string.count == 8 {
			let mask = 0x000000FF
			let redMask = Int(color >> 24) & mask
			let greenMask = Int(color >> 16) & mask
			let blueMask = Int(color >> 8) & mask
			let alphaMask = Int(color) & mask

			let red = Double(redMask) / 255.0
			let green = Double(greenMask) / 255.0
			let blue = Double(blueMask) / 255.0
			let alpha = Double(alphaMask) / 255.0

			self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
		} else {
			self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
		}
	}
}
