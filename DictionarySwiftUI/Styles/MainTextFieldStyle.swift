//
//  MainTextFieldStyle.swift
//  DictionarySwiftUI
//
//  Created by Vyacheslav Agarkov on 19.10.2021.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
	var backroundColor: Color

	// swiftlint:disable identifier_name
	public func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(
				EdgeInsets(
					top: 5,
					leading: 10,
					bottom: 5,
					trailing: 10
				)
			)
			.background(backroundColor)
			.cornerRadius(10)
	}
	// swiftlint:enable identifier_name
}
